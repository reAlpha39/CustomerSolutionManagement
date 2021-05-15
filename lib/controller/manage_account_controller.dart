import 'package:collection/collection.dart' show IterableExtension;
import 'package:customer/models/users.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ManageAccountController extends GetxController {
  DatabaseProvider databaseProvider = DatabaseProvider();
  PanelController? panelController;
  TextEditingController? namaTEC;
  TextEditingController? usernameTEC;
  TextEditingController? passwordTEC;
  GlobalKey<FormState>? formKey;

  RxBool isLoading = false.obs;
  RxInt radio = 2.obs;
  Map<int, String> radioData = {
    0: 'admin',
    1: 'internal',
    2: 'customer',
  };
  late RxList<Users> listUser;
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

  @override
  void onClose() {
    namaTEC?.dispose();
    usernameTEC?.dispose();
    passwordTEC?.dispose();
    super.onClose();
  }

  // Called ketika panel ditutup
  onPanelClose() {
    titleCard.value = 'Create Account';
    textButton.value = 'Create';
    clearData();
  }

  validateTextField() {
    var form = formKey!.currentState!;
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

  deleteAccount(String? username) {
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.deleteAccount(username).then((value) {
          listUsers();
          closeCurrentDialog();
        });
      } else {
        closeCurrentDialog();
      }
    });
  }

  createAccount() {
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        databaseProvider.usernameChecker(usernameTEC!.text).then((available) {
          if (available) {
            Users users = Users(
              nama: namaTEC!.text,
              username: usernameTEC!.text,
              password: passwordTEC!.text,
              type: radioData[radio.value],
            );
            databaseProvider.createAccount(users).then((_) {
              clearData();
              closeCurrentDialog();
              panelController!.close();
              listUsers();
            });
          } else {
            closeCurrentDialog();
            _showDialogError(
                title: 'Create error',
                middleText: 'Username sudah terdapat dalam database');
          }
        });
      } else {
        closeCurrentDialog();
      }
    });
  }

  displayDataToCard(Users user) {
    titleCard.value = 'Update Account';
    textButton.value = 'Update';
    var radioKey =
        radioData.keys.firstWhereOrNull((k) => radioData[k] == user.type)!;
    namaTEC!.text = user.nama!;
    usernameTEC!.text = user.username!;
    passwordTEC!.text = user.password!;
    radio.value = radioKey;
    panelController!.open();
  }

  updateAccount() {
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        Users users = Users(
          nama: namaTEC!.text,
          username: usernameTEC!.text,
          password: passwordTEC!.text,
          type: radioData[radio.value],
        );
        databaseProvider.createAccount(users).then((_) {
          clearData();
          closeCurrentDialog();
          listUsers();
          panelController!.close();
        });
      } else {
        closeCurrentDialog();
      }
    });
  }

  void closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  _showDialogError({required String title, required String middleText}) {
    Get.defaultDialog(
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back());
  }

  clearData() {
    namaTEC!.clear();
    usernameTEC!.clear();
    passwordTEC!.clear();
    radio.value = 2;
  }
}
