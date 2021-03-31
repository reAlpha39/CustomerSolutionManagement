import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/models/support_ut.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseProvider {
  LoginController loginController = LoginController();
  Users users = Users();
  FirebaseFirestore firestore;

  //Inisialisasi Firebase instance
  Future<FirebaseApp> getFirestore() async {
    FirebaseApp firebaseApp;
    await Firebase.initializeApp().then((value) => firebaseApp = value);
    return firebaseApp;
  }

  //validate username
  Future<Users> validateUser(String username) async {
    Users user;
    try {
      firestore = FirebaseFirestore.instance;
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
  saveData(SupportUt supportUt) {
    firestore = FirebaseFirestore.instance;
    var data = supportUt.toMap();
    DocumentReference doc =
        firestore.collection('data_customer').doc(supportUt.namaCustomer);
    CollectionReference collection = doc.collection('need_support');
    collection.get().then((value) {
      if (value.size == 0) {
        collection.doc('ticket_1').set(data).then((_) => showDialog(
            title: "Sukses", middleText: "Data berhasil dimasukkan"));
      } else {
        collection.doc('ticket_${value.size + 1}').set(data).then((_) =>
            showDialog(
                title: "Sukses", middleText: "Data berhasil dimasukkan"));
      }
    });
  }

  //Save MSPP Dipisah perdokumen
  saveMSPP(Mspp mspp, String username) {
    firestore = FirebaseFirestore.instance;
    var data = mspp.toMap();
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('mspp');
    collection.get().then((value) {
      collection
          .doc('periodic_inspection')
          .set(data['periodicInspection'])
          .then((_) => collection
              .doc('periodic_service_plan')
              .set(data['periodicServicePlan'])
              .then((_) => collection
                  .doc('periodic_service')
                  .set(data['periodicService'])
                  .then((value) => showDialog(
                      title: "Sukses",
                      middleText: "Data berhasil dimasukkan"))));
    });
  }

  //menampilkan dialog
  showDialog({String title, String middleText}) {
    Get.defaultDialog(
        barrierDismissible: false,
        titleStyle: TextStyle(fontSize: 24),
        middleTextStyle: TextStyle(fontSize: 18),
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        radius: 17,
        buttonColor: Colors.yellow.shade600,
        confirmTextColor: Colors.black87,
        onConfirm: () => Get.back(closeOverlays: false));
  }
}
