import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/models/data_customer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseProvider {
  FirebaseFirestore firestore;

  getFirestore() {
    Firebase.initializeApp().then((value) => null);
    firestore = FirebaseFirestore.instance;
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
