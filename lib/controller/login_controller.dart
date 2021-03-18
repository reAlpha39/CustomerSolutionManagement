import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //Mengambil LoginController instance dimanapun dalam app
  //Dengan mengetik LoginController.to
  static LoginController to = Get.find();

  TextEditingController usernameTextController;
  TextEditingController passwordTextController;

  //Observalbe object
  Rx<Users> usr = Users().obs;
  RxBool isValidate = false.obs;
  RxInt state = 0.obs;

  @override
  void onInit() {
    usernameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }

  void userLogin() {
    //   Get.dialog(Center(child: CircularProgressIndicator()),
    //       barrierDismissible: false);
    state.value = 1;
    _validateUser().then((value) {
      if (value != null) {
        usr.value = value;
        _validateUserPass();
        state.value = 2;
        print(isValidate.value);
        if (isValidate.value) {
          Get.offAndToNamed('/main_page_customer');
          usernameTextController.text = '';
          passwordTextController.text = '';
        } else {
          Get.defaultDialog(
              title: 'Login Gagal',
              middleText: 'Username atau password salah!',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () => Get.back());
        }
      } else {
        state.value = 2;
        Get.defaultDialog(
            title: 'Login Gagal',
            middleText: 'Username tidak ditemukan!',
            textConfirm: 'OK',
            confirmTextColor: Colors.white,
            onConfirm: () => Get.back());
      }
    });
  }

  Future<Users> _validateUser() async {
    Users user;
    try {
      await Firebase.initializeApp();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      List<QueryDocumentSnapshot> dataUser;
      await firestore
          .collection('users')
          .where('username', isEqualTo: usernameTextController.text)
          .get()
          .then((value) => dataUser = value.docs);
      if (dataUser.length == 1) {
        user = Users.fromMap(dataUser[0].data());
      }
    } catch (e) {
      Exception("Connection error");
    }
    return user;
  }

  void _validateUserPass() {
    if (usernameTextController.text == usr.value.username &&
        passwordTextController.text == usr.value.password) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }
}