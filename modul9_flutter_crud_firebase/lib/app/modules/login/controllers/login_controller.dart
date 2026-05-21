import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:modul9_flutter_crud_firebase/app/routes/app_pages.dart';
import 'package:modul9_flutter_crud_firebase/app/widgets/custom_toast.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: emailC.text.trim(),
          password: passC.text,
        );

        if (credential.user != null) {
          String uid = auth.currentUser!.uid;

          await firestore.collection("users").doc(uid).get();

          Get.offAllNamed(Routes.HOME);
        }

        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;

        if (e.code == 'user-not-found') {
          CustomToast.errorToast("Error", "Akun tidak ditemukan");
        } else if (e.code == 'wrong-password') {
          CustomToast.errorToast("Error", "Kata sandi salah");
        }
      } catch (e) {
        isLoading.value = false;
        CustomToast.errorToast("Error", "Error dikarenakan : ${e.toString()}");
      }
    } else {
      CustomToast.errorToast(
        "Error",
        "Anda harus mengisikan email dan kata sandi",
      );
    }
  }
}
