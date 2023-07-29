import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

late Rx<File?> _pickedImage;
File? get ProfilePhoto => _pickedImage.value;
  pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      Get.snackbar("Profile Picture", "Selected Successfully");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }
  Future<String> _uplodaToStorage(File image) async {
    Reference ref = firebaseStroge
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uplodaToStorage(image);
        model.User user = model.User(
            name: username,
            profilePhoto: downloadUrl,
            email: email,
            uid: cred.user!.uid);
        await firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar("Error Creating Account", "Please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Creating Account", e.toString());
    }
  }
}
