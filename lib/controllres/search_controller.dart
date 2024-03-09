import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/models/user.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchUsers => _searchUsers.value;
  searchUser(String typerUser) async {
    firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typerUser)
        .snapshots()
        .map((QuerySnapshot query) {});
  }
}
