import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/audit_table_data.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/models/other_program.dart';
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
    DocumentReference doc =
        firestore.collection('data_customer').doc(supportUt.namaCustomer);
    CollectionReference collection = doc.collection('need_support');
    collection.get().then((value) {
      if (value.size == 0) {
        supportUt.id = '1000001';
        collection.doc(supportUt.id).set(supportUt.toMap()).then((_) =>
            showDialog(
                title: "Sukses", middleText: "Data berhasil dimasukkan"));
      } else {
        supportUt.id = '${searchLastId(value) + 1}';
        collection.doc(supportUt.id).set(supportUt.toMap()).then((_) =>
            showDialog(
                title: "Sukses", middleText: "Data berhasil dimasukkan"));
      }
    });
  }

  int searchLastId(QuerySnapshot querySnapshot) {
    int id;
    var data = querySnapshot.docs.last.data();
    id = int.tryParse(data['id']);
    return id;
  }

  //Save MSPP Dipisah perdokumen
  saveMSPP(Mspp mspp, String username) {
    firestore = FirebaseFirestore.instance;
    var data = mspp.toMap();
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('service_program');
    collection.get().then((value) {
      collection.doc('mspp').set(data).then((_) =>
          showDialog(title: "Sukses", middleText: "Data berhasil dimasukkan"));
    });
  }

  //Save Other Program Data
  saveOtherProgram(OtherProgram otherProgram, String username) {
    firestore = FirebaseFirestore.instance;
    var data = otherProgram.toMap();
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('service_program');
    collection.get().then((value) {
      collection.doc('other_program').set(data).then((_) =>
          showDialog(title: "Sukses", middleText: "Data berhasil dimasukkan"));
    });
  }

  Future<Mspp> loadMsppData(String username) async {
    Mspp mspp = Mspp();
    firestore = FirebaseFirestore.instance;
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('service_program');
    var data = await collection.doc('mspp').get();
    if (data.exists) {
      mspp = Mspp.fromMap(data.data());
    }
    return mspp;
  }

  //load other program data from database
  Future<OtherProgram> loadOtherProgramData(String username) async {
    OtherProgram otherProgram = OtherProgram();
    firestore = FirebaseFirestore.instance;
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('service_program');
    var data = await collection.doc('other_program').get();
    if (data.exists) {
      otherProgram = OtherProgram.fromMap(data.data());
    }
    return otherProgram;
  }

  Future<List<String>> listCustomer() async {
    List<String> listCustomer = [];
    firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection('users').get();
    var docs = snapshot.docs;
    for (int i = 0; i <= docs.length - 1; i++) {
      Users users = Users.fromMap(docs[i].data());
      if (users.type == 'customer') {
        listCustomer.add(users.username);
      }
    }
    return listCustomer;
  }

  //Mengecek apakah username apakah sudah ada di database
  Future<bool> usernameChecker(String username) async {
    bool isAvailable = false;
    firestore = FirebaseFirestore.instance;
    var data = await firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    if (data.docs.length == 0) {
      isAvailable = true;
    }
    return isAvailable;
  }

  //Membuat akun user
  Future<bool> createAccount(Users users) async {
    bool isSuccess = false;
    var data = users.toMap();
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('users');
    collection.doc(users.username).set(data).then((_) {
      showDialog(title: "Sukses", middleText: "User berhasil dibuat");
      isSuccess = true;
    });
    return isSuccess;
  }

  //Update akun
  Future<bool> updateAccount(Users user) async {
    bool isSuccess = false;
    var data = user.toMap();
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('users');
    collection.doc(users.username).set(data).then((_) {
      showDialog(
          title: 'Sukses', middleText: 'Data user berhasil diperbaharui');
      isSuccess = true;
    });
    return isSuccess;
  }

  //Delete akun
  Future<bool> deleteAccount(String username) async {
    bool isSuccess = false;
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('users');
    collection.doc(username).delete().then((_) {
      showDialog(title: 'Sukses', middleText: 'Data berhasil dihapus');
      isSuccess = true;
    });
    return isSuccess;
  }

  //List Users
  Future<List<Users>> listUsers() async {
    List<Users> list = [];
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('users');
    var data = await collection.get().then((value) {
      for (int i = 0; i <= value.docs.length - 1; i++) {
        Users user = Users.fromMap(value.docs[i].data());
        list.add(user);
      }
    });
    return list;
  }

  Future<AuditTableData> auditDataTable(
      {String docA, String collectionA, String docB}) async {
    AuditTableData tableData = AuditTableData();
    try {
      firestore = FirebaseFirestore.instance;
      CollectionReference collection = firestore.collection('checklist_audit');
      DocumentSnapshot data =
          await collection.doc(docA).collection(collectionA).doc(docB).get();
      tableData = AuditTableData.fromMap(data.data());
    } on Exception catch (e) {}
    return tableData;
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
