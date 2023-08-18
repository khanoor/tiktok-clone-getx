import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import '../constants.dart';

class UploadVideoController extends GetxController {
  _compressVideo(String videoPath){
    
  }
  _uploadVideoToStorage(String id, String videoPath) {
    Reference ref = firebaseStroge.ref().child('videos').child(id);
    ref.putFile(_compressVideo(videoPath));
  }

  uploadVideo(String songName, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      _uploadVideoToStorage("video $len", videoPath);
    } catch (e) {}
  }
}
