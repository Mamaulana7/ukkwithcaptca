import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/page_index_controller.dart';
import '../menu.dart';
import '../routes/app_pages.dart';
import '../widget/toast/custom_toach.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  checkDefaultPassword() {
    Get.offAllNamed(Routes.MENU);
    Get.offAllNamed(Routes.ADMIN);
    pageIndexController.changePage(0);
  }

  Future<void> login() async {
    //cek apakah email dan password tidak kosong
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: emailC.text.trim(),
          password: passC.text,
        );
        if (credential.user != null) {
          String uid = auth.currentUser!.uid;
          await firestore
              .collection('users')
              .doc(uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              if (documentSnapshot.get('role') == "Admin") {
                Get.toNamed(Routes.ADMIN);
              } else {
                if (documentSnapshot.get('role') == "Pengunjung") {
                  Get.toNamed(Routes.MENU);
                }
              }
            } else {
              print('Document does not exist on the database');
            }
          });
          isLoading.value = false;
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        // pesan jika akun tidak ditemukan
        if (e.code == 'user-not-found') {
          CustomToast.errorToast('Error', 'Akun Tidak Ditemukan');
        }
        // Pesan jika memasukan sandi salah
        else if (e.code == 'wrong-password') {
          CustomToast.errorToast('Error', 'Kata Sandi Salah');
        }
        // pesan jika error tidak diketahui
        else {
          CustomToast.errorToast('Error', 'error : ${e.code}');
        }
      } catch (e) {
        isLoading.value = false;
        CustomToast.errorToast('Error', 'error : ${e.toString()}');
      }
    } else {
      CustomToast.errorToast(
          'Error', 'Anda Harus mengisikan email dan kata sandi');
    }
  }
}
