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

  // Called ketika panel ditutup
  onPanelClose() {
    titleCard.value = 'Create Account';
    textButton.value = 'Create';
    clearData();
  }

  validateTextField() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      if (textButton.value == "Create") {
        createAccount();
      } else if (textButton.value == "Update") {
        updateAccount();
      }
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

  displayDataToCard(Users user) {
    titleCard.value = 'Update Account';
    textButton.value = 'Update';
    var radioKey = radioData.keys
        .firstWhere((k) => radioData[k] == user.type, orElse: () => null);
    namaTEC.text = user.nama;
    usernameTEC.text = user.username;
    passwordTEC.text = user.password;
    radio.value = radioKey;
    panelController.open();
  }

  updateAccount() {
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
          listUsers();
          panelController.close();
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
