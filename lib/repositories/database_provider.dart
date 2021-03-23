import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/data_customer.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseProvider {
  final LoginController loginController = LoginController();
  FirebaseFirestore firestore;

  getFirestore() {
    Firebase.initializeApp().then((value) => null);
    firestore = FirebaseFirestore.instance;
  }

  //validate username
  Future<Users> validateUser(String username) async {
    Users user;
    try {
      await Firebase.initializeApp();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      List<QueryDocumentSnapshot> dataUser;
      await firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .get()
          .then((value) => dataUser = value.docs);
      if (dataUser.length == 1) {
        user = Users.fromMap(dataUser[0].data());
      }
    } on FirebaseException catch (e) {
      loginController.isLoading.value = false;
    }
    return user;
  }

  //Save data
  saveData(DataCustomer dataCustomer) {
    getFirestore();
    var data = dataCustomer.toMap();
    print(data);
    firestore
        .collection("data_customer")
        .doc(dataCustomer.namaCustomer)
        .set(data)
        .then((_) => showDialog(
            title: "Sukses", middleText: "Data berhasil dimasukkan"));
  }

  //menampilkan dialog
  showDialog({String title, String middleText}) {
    Get.defaultDialog(
        titleStyle: TextStyle(fontSize: 24),
        middleTextStyle: TextStyle(fontSize: 18),
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        radius: 17,
        buttonColor: Colors.yellow.shade600,
        confirmTextColor: Colors.black87,
        onConfirm: () => Get.offAndToNamed('/main_page_customer'));
  }
}
