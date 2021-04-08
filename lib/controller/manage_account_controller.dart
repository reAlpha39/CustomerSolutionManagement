import 'package:customer/models/users.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAccountController extends GetxController {
  DatabaseProvider databaseProvider = DatabaseProvider();
  TextEditingController namaTEC;
  TextEditingController usernameTEC;
  TextEditingController passwordTEC;
  GlobalKey<FormState> formKey;

  RxBool isLoading = false.obs;
  RxInt radio = 2.obs;
  Map<int, String> radioData = {
    0: 'admin',
    1: 'internal',
    2: 'customer',
  };
  RxList<Users> listUser;

  @override
  void onInit() {
    namaTEC = TextEditingController();
    usernameTEC = TextEditingController();
    passwordTEC = TextEditingController();
    formKey = GlobalKey<FormState>();
    listUsers();
    super.onInit();
  }

  validateTextField() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      createAccount();
    }
  }

  listUsers() {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.listUsers().then((value) {
          listUser = value.obs;
          isLoading.value = false;
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  createAccount() {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.usernameChecker(usernameTEC.text).then((available) {
          if (available) {
            Users users = Users(
              nama: namaTEC.text,
              username: usernameTEC.text,
              password: passwordTEC.text,
              type: radioData[radio],
            );
            databaseProvider.createAccount(users).then((_) {
              _clearData();
              isLoading.value = false;
              listUsers();
            });
          } else {
            isLoading.value = false;
            _showDialogError(
                title: 'Create error',
                middleText: 'Username sudah terdapat dalam database');
          }
        });
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

  _clearData() {
    namaTEC.clear();
    usernameTEC.clear();
    passwordTEC.clear();
    radio.value = 2;
  }
}
