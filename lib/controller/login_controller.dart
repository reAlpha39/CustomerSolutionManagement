import 'package:customer/models/users.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameTextController;
  TextEditingController passwordTextController;

  //Observalbe object
  Rx<Users> usr = Users().obs;
  RxBool isValidate = false.obs;
  //RxInt state = 0.obs;
  RxBool isLoading = false.obs;

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
    DatabaseProvider databaseProvider = DatabaseProvider();
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.getFirestore().then((value) => databaseProvider
                .validateUser(usernameTextController.text)
                .then((value) {
              if (value != null) {
                usr.value = value;
                _validateUserPass();
                isLoading.value = false;
                print(isValidate.value);
                if (isValidate.value) {
                  Get.offAndToNamed('/home_page');
                  usernameTextController.text = '';
                  passwordTextController.text = '';
                } else {
                  _showDialogError(
                    title: 'Login Gagal',
                    middleText: 'Username atau password salah!',
                  );
                }
              } else {
                isLoading.value = false;
                _showDialogError(
                  title: 'Login Gagal',
                  middleText: 'Username tidak ditemukan!',
                );
              }
            }));
      } else {
        isLoading.value = false;
      }
    });
  }

  _showDialogError({String title, String middleText}) {
    Get.defaultDialog(
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back());
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
