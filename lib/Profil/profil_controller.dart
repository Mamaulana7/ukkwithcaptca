import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController usernameC = TextEditingController();
  TextEditingController dataidC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();

  Stream<DocumentSnapshot<Map<String, dynamic>>> pengaturandata() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }

  XFile? image;

  Future<void> AddProfil() async {
    isLoading.value = false;
    try {
      if (image != null) {
        // upload image ke firestore
        File file = File(image!.path);
        await storage.ref(dataidC.text).putFile(file);
      }
      image = null;
      String avatar = await storage.ref(dataidC.text).getDownloadURL();
      DocumentReference respons =
          firestore.collection('users').doc(dataidC.text);
      respons.set({
        "profil": avatar,
      });
    } catch (e) {}
  }

  Future<DocumentSnapshot<Object?>> dapatkanData(String id) async {
    DocumentReference data = firestore.collection("users").doc(id);
    return data.get();
  }
}
