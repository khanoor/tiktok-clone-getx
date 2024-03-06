import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/controllres/auth_controller.dart';
import 'package:tiktok/views/screens/add_video_screen.dart';
import 'package:tiktok/views/screens/auth/video_screen.dart';

const pages = [
 VideoScreen(),
  Text("Serach Screen"),
  AddVideroScreen(), 
  Text("Messages Screen"),
  Text("Profile Screen"),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// controller
var authController = AuthController.instance;
