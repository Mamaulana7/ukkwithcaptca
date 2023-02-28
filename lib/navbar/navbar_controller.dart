import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxBool isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static NavbarController instance = Get.find();

  Stream<DocumentSnapshot<Map<String, dynamic>>> navbardata() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }
}
