import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:image_picker/image_picker.dart';
import '../controllers/page_index_controller.dart';
import '../widget/toast/custom_toach.dart';

class RegistrationController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  XFile? image;

  checkDefaultPassword() {}

  String? selectedValue;

  Future<void> registration() async {
    if (passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        // jika password sama maka  akan dibuatkan akun untuk siswa
        UserCredential respondentCredential =
            await auth.createUserWithEmailAndPassword(
          email: emailC.text.trim(), // menghilangkan spasi
          password: passC.text,
        );

        //Pengecekan apakah akun sudah dibuatkan oleh firebase
        if (respondentCredential.user != null) {
          String uid = respondentCredential.user!.uid;

          DocumentReference respondents =
              firestore.collection("users").doc(uid);
          //Menyimpan data ke firebase dengan menggunakan perintah set
          await respondents.set({
            "id": uid,
            "email": emailC.text,
            "username": nameC.text.trim(),
            "password": passC.text,
            "created_at": DateTime.now().toIso8601String(),
            "role": selectedValue.toString(),
            "profil": "profil",
          });

          await respondentCredential.user!.sendEmailVerification();

          //membutuhkan logut dikarenakan user sudah dibuatkan dan harus login
          auth.signOut();
          //butuh login kembali / login
          await auth.signInWithEmailAndPassword(
              email: emailC.text, password: passC.text);

          Get.back(); //tutup dialog
          Get.back(); //tutup halaman pendaftaran

          // tampilkan pesan sukses mendaftar
          CustomToast.successToast('Success', 'Berhasil Mendaftarkan Siswa');

          isLoading.value = false;
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        // pesan jika passwordnya pendek / kuran dari 6 karakter
        if (e.code == 'weak-password') {
          CustomToast.errorToast('Error', 'Kata Sandi Terlalu Pendek');
        }
        // Pesan jika email sudah digunakan oleh pengguna lain
        else if (e.code == 'email-already-in-use') {
          CustomToast.errorToast(
              'Error', 'Email Sudah digunakan oleh siswa lain');
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
      CustomToast.errorToast('Error', 'Kata Sandi Harus Diisikan');
    }
  }

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    image = XFile(imagePicked!.path);
  }
}
