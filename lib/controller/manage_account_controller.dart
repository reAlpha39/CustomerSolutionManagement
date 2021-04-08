import 'package:customer/models/users.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ManageAccountController extends GetxController {
  DatabaseProvider databaseProvider = DatabaseProvider();
  PanelController panelController;
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
  RxString textButton = 'Create'.obs;
  RxString titleCard = 'Create Account'.obs;

  @override
  void onInit() {
    panelController = PanelController();
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

  createOrUpdate() {
    if (textButton.value == "Create") {
      validateTextField();
    } else if (textButton.value == "Update") {
      updateAccount();
    }
  }

  deleteAccount(String username) {
    showProgressDialog();
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.deleteAccount(username).then((value) {
          isLoading.value = false;
          listUsers();
          Get.back();
        });
      } else {
        isLoading.value = false;
        Get.back();
      }
    });
  }

  createAccount() {
    showProgressDialog();
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
              clearData();
              isLoading.value = false;
              listUsers();
              Get.back();
            });
          } else {
            isLoading.value = false;
            Get.back();
            _showDialogError(
                title: 'Create error',
                middleText: 'Username sudah terdapat dalam database');
          }
        });
      } else {
        isLoading.value = false;
        Get.back();
      }
    });
  }

  changeTextButton() {
    if (namaTEC.text.isNotEmpty) {
      textButton.value = 'Update';
      titleCard.value = 'Update Account';
    } else {
      textButton.value = 'Create';
      titleCard.value = 'Create Account';
    }
  }

  displayDataToCard(Users user) {
    var radioKey = radioData.keys
        .firstWhere((k) => radioData[k] == user.type, orElse: () => null);
    namaTEC.text = user.nama;
    usernameTEC.text = user.username;
    passwordTEC.text = user.password;
    radio.value = radioKey;
    panelController.open();
  }

  updateAccount() {
    showProgressDialog();
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        Users users = Users(
          nama: namaTEC.text,
          username: usernameTEC.text,
          password: passwordTEC.text,
          type: radioData[radio],
        );
        databaseProvider.createAccount(users).then((_) {
          clearData();
          isLoading.value = false;
          Get.back();
          listUsers();
          panelController.close();
        });
      } else {
        isLoading.value = false;
        Get.back();
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

  clearData() {
    namaTEC.clear();
    usernameTEC.clear();
    passwordTEC.clear();
    radio.value = 2;
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }
}
