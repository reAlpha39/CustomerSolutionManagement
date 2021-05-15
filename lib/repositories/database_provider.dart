import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/audit_table_data.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/models/checklist_audit/checklist_element.dart';
import 'package:customer/models/checklist_audit/list_checklist_audit.dart';
import 'package:customer/models/improve_process.dart';
import 'package:customer/models/iw_data_table.dart';
import 'package:customer/models/model_unit.dart';
import 'package:customer/models/support_ut.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseProvider {
  LoginController loginController = LoginController();
  Users users = Users();
  late FirebaseFirestore firestore;

  //Inisialisasi Firebase instance
  Future<FirebaseApp?> getFirestore() async {
    FirebaseApp? firebaseApp;
    await Firebase.initializeApp().then((value) => firebaseApp = value);
    return firebaseApp;
  }

  //validate username
  Future<Users?> validateUser(String username) async {
    Users? user;
    try {
      firestore = FirebaseFirestore.instance;
      late List<QueryDocumentSnapshot> dataUser;
      await firestore
          .collection('data_customer')
          .where('username', isEqualTo: username)
          .get()
          .then((value) => dataUser = value.docs);
      if (dataUser.length == 1) {
        user = Users.fromMap(dataUser[0].data() as Map<String, dynamic>);
      }
    } on FirebaseException catch (e) {
      print(e);
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
        supportUt.id = '${searchLastId(value)! + 1}';
        collection.doc(supportUt.id).set(supportUt.toMap()).then((_) =>
            showDialog(
                title: "Sukses", middleText: "Data berhasil dimasukkan"));
      }
    });
  }

  int? searchLastId(QuerySnapshot querySnapshot) {
    int? id;
    var data = querySnapshot.docs.last.id;
    id = int.tryParse(data);
    return id;
  }

  Future<List<String>> listCustomer() async {
    List<String> listCustomer = [];
    firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection('data_customer').get();
    var docs = snapshot.docs;
    for (int i = 0; i <= docs.length - 1; i++) {
      Users users = Users.fromMap(docs[i].data() as Map<String, dynamic>);
      if (users.type == 'customer') {
        listCustomer.add(users.username!);
      }
    }
    return listCustomer;
  }

  //Mengecek apakah username apakah sudah ada di database
  Future<bool> usernameChecker(String username) async {
    bool isAvailable = false;
    firestore = FirebaseFirestore.instance;
    var data = await firestore
        .collection('data_customer')
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
    CollectionReference collection = firestore.collection('data_customer');
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
    CollectionReference collection = firestore.collection('data_customer');
    collection.doc(users.username).set(data).then((_) {
      showDialog(
          title: 'Sukses', middleText: 'Data user berhasil diperbaharui');
      isSuccess = true;
    });
    return isSuccess;
  }

  //Delete akun
  Future<bool> deleteAccount(String? username) async {
    bool isSuccess = false;
    if (username != loginController.usr.value.username) {
      firestore = FirebaseFirestore.instance;
      try {
        DocumentReference docRef =
            firestore.collection('data_customer').doc(username);
        var snapshot = await docRef.collection('improve_process').get();
        var datas = snapshot.docs;
        for (int i = 0; i <= datas.length - 1; i++) {
          IpData ipData = IpData.fromMap(datas[i].data());
          if (ipData.picturePathBefore != "") {
            await firebase_storage.FirebaseStorage.instance
                .refFromURL(ipData.picturePathBefore!)
                .delete();
          }
          if (ipData.picturePathAfter != "") {
            await firebase_storage.FirebaseStorage.instance
                .refFromURL(ipData.picturePathAfter!)
                .delete();
          }
        }
        CollectionReference colNs = docRef.collection('need_support');
        await deleteCollection(colNs, docRef, false);

        CollectionReference colCa = docRef.collection('checklist_audit');
        await deleteCollection(colCa, docRef, true);

        CollectionReference colIp = docRef.collection('improve_process');
        await deleteCollection(colIp, docRef, false);

        docRef.delete().then((_) {
          showDialog(title: 'Sukses', middleText: 'Data berhasil dihapus');
          isSuccess = true;
        });
      } catch (e, s) {
        print("deleteUser: " + e.toString());
        print(s);
      }
    } else {
      showDialog(
          title: 'Gaga;', middleText: 'Tidak dapat menghapus akun sendiri');
    }
    return isSuccess;
  }

  Future<void> deleteCollection(
      CollectionReference colRef, DocumentReference docRef, bool isCa) async {
    try {
      QuerySnapshot querySnapshot = await colRef.get();
      print(isCa);
      for (int j = 0; j <= querySnapshot.docs.length - 1; j++) {
        if (isCa) {
          CollectionReference colElement =
              colRef.doc(querySnapshot.docs[j].id).collection('element');
          var dataElement = await colElement.get();
          for (int k = 0; k <= dataElement.docs.length - 1; k++) {
            await colElement.doc(dataElement.docs[k].id).delete();
          }
        }
        await colRef.doc(querySnapshot.docs[j].id).delete();
      }
    } catch (e) {
      print("deleteCollection: " + e.toString());
    }
  }

  //List Users
  Future<List<Users>> listUsers() async {
    List<Users> list = [];
    firestore = FirebaseFirestore.instance;
    CollectionReference collection = firestore.collection('data_customer');
    await collection.get().then((value) {
      for (int i = 0; i <= value.docs.length - 1; i++) {
        Users user =
            Users.fromMap(value.docs[i].data() as Map<String, dynamic>);
        list.add(user);
      }
    });
    return list;
  }

  Future auditDataTable(
      {String? docA, required String collectionA, String? docB}) async {
    var tableData;
    try {
      firestore = FirebaseFirestore.instance;
      CollectionReference collection = firestore.collection('checklist_audit');
      DocumentSnapshot data =
          await collection.doc(docA).collection(collectionA).doc(docB).get();
      if (collectionA == 'inventory_warehousing') {
        tableData = IwDataTable.fromMap(data.data() as Map<String, dynamic>);
      } else {
        tableData = AuditTableData.fromMap(data.data() as Map<String, dynamic>);
      }
    } on Exception catch (e) {
      print("auditDataTable: " + e.toString());
    }
    return tableData;
  }

  Future<ModelUnit?> loadModelUnit() async {
    ModelUnit? unit;
    try {
      firestore = FirebaseFirestore.instance;
      var data =
          await firestore.collection('initial_data').doc('model_unit').get();
      unit = ModelUnit.fromMap(data.data()!);
    } catch (e) {
      print(e);
    }
    return unit;
  }

  Future loadImproveProcessData(String? username) async {
    ImproveProcess improveProcess = ImproveProcess();
    improveProcess.improveProcesData = [];
    try {
      firestore = FirebaseFirestore.instance;
      QuerySnapshot docRef = await firestore
          .collection('data_customer')
          .doc(username)
          .collection('improve_process')
          .get();
      for (int i = 0; i <= docRef.docs.length - 1; i++) {
        QueryDocumentSnapshot doc = docRef.docs[i];
        var data = doc.data();
        IpData ipData = IpData.fromMap(data as Map<String, dynamic>);
        ipData.id = doc.id;
        improveProcess.improveProcesData!.add(ipData);
      }
    } on FirebaseException catch (e) {
      print(e);
    }
    return improveProcess;
  }

  Future<bool> saveImproveProcessData(
      IpData data, String? username, String? docName) async {
    bool isSuccess = false;
    firestore = FirebaseFirestore.instance;
    try {
      var map = data.toMap();
      DocumentReference docRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('improve_process')
          .doc(docName);
      await docRef.set(map);
      isSuccess = true;
    } on FirebaseException catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<String?> uploadImproveProcessImage(
      File image, String filename, String? username) async {
    String? downloadUrl;
    try {
      if (image.existsSync()) {
        var task = await firebase_storage.FirebaseStorage.instance
            .ref("improve_process/" + username!)
            .child(filename)
            .putFile(image);
        downloadUrl = await task.ref.getDownloadURL();
      } else {
        downloadUrl = "";
      }
    } on FirebaseException catch (e) {
      print(e);
    }
    return downloadUrl;
  }

  Future<bool> updateImproveProcessData(
      IpData data, String? username, String? docName) async {
    bool isSuccess = false;
    firestore = FirebaseFirestore.instance;
    try {
      var map = data.toMap();
      DocumentReference docRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('improve_process')
          .doc(docName);
      await docRef.update(map);
      isSuccess = true;
    } on FirebaseException catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<bool> deleteImproveProcess(
      {required IpData ipData, String? username}) async {
    bool isDeleted = false;
    firestore = FirebaseFirestore.instance;
    try {
      DocumentReference docRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('improve_process')
          .doc(ipData.id);
      if (ipData.picturePathBefore != "") {
        await deletePicture(ipData.picturePathBefore!);
      }
      if (ipData.picturePathAfter != "") {
        await deletePicture(ipData.picturePathAfter!);
      }
      await docRef.delete();
      isDeleted = true;
    } on FirebaseException catch (e) {
      print(e);
    }
    return isDeleted;
  }

  Future<void> deletePicture(String path) async {
    try {
      await firebase_storage.FirebaseStorage.instance.refFromURL(path).delete();
    } catch (e) {
      print("deletePicture: " + e.toString());
    }
  }

  Future<bool> saveChecklistData(
      ListChecklistAudit listChecklistAudit, String username) async {
    bool isSuccess = false;
    firestore = FirebaseFirestore.instance;
    try {
      CollectionReference colRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('checklist_audit');
      bool isDataExist = await checkData(colRef);
      DocumentReference docRefA;
      DocumentReference docRefB;
      var temp;
      for (int i = 0; i <= listChecklistAudit.checklistAudit!.length - 1; i++) {
        docRefA = colRef.doc(listChecklistAudit.checklistAudit![i].id);
        if (isDataExist) {
          await docRefA.update(listChecklistAudit.checklistAudit![i].toMap());
        } else {
          await docRefA.set(listChecklistAudit.checklistAudit![i].toMap());
        }
        for (int j = 0;
            j <=
                listChecklistAudit.checklistAudit![i].checklistElement!.length -
                    1;
            j++) {
          temp = listChecklistAudit.checklistAudit![i].checklistElement![j]
              .toMap();
          ChecklistElement checklistElement = ChecklistElement.fromMap(temp);
          docRefB = colRef
              .doc(listChecklistAudit.checklistAudit![i].id)
              .collection('element')
              .doc(checklistElement.id);
          if (isDataExist) {
            await docRefB.update(checklistElement.toMap());
          } else {
            await docRefB.set(checklistElement.toMap());
          }
          isSuccess = true;
        }
      }
    } catch (e, s) {
      print("saveChecklistData: " + e.toString());
      print(s);
    }
    return isSuccess;
  }

  Future<ListChecklistAudit> loadCheckListData(
      {String? username, String? part}) async {
    firestore = FirebaseFirestore.instance;
    ListChecklistAudit listChecklistAudit = ListChecklistAudit();
    ChecklistAudit checklistAudit = ChecklistAudit();
    try {
      CollectionReference colRef;
      colRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('checklist_audit');
      bool isDataExist = await checkData(colRef);
      QuerySnapshot data;
      if (!isDataExist) {
        colRef = firestore
            .collection('initial_data')
            .doc('checklist_audit')
            .collection('data');
      }
      if (part != null) {
        data = await colRef.where('part', isEqualTo: part).get();
      } else {
        data = await colRef.get();
      }
      List<ChecklistAudit> tempA = [];
      for (int i = 0; i <= data.docs.length - 1; i++) {
        checklistAudit =
            ChecklistAudit.fromMap(data.docs[i].data() as Map<String, dynamic>);
        List<ChecklistElement> tempB = [];
        QuerySnapshot dataB =
            await colRef.doc(data.docs[i].id).collection('element').get();
        for (int j = 0; j <= dataB.docs.length - 1; j++) {
          tempB.add(ChecklistElement.fromMap(
              dataB.docs[j].data() as Map<String, dynamic>));
        }
        checklistAudit.checklistElement = tempB;
        tempA.add(checklistAudit);
      }
      listChecklistAudit.checklistAudit = tempA;
    } catch (e) {
      print(e);
    }
    return listChecklistAudit;
  }

  Future<bool> checkData(CollectionReference colRef) async {
    bool isExist = false;
    firestore = FirebaseFirestore.instance;
    try {
      DocumentSnapshot checkData =
          await colRef.doc('periodic_inspection').get();
      if (checkData.exists) {
        isExist = true;
      } else {
        isExist = false;
      }
    } catch (e) {
      print(e);
    }
    return isExist;
  }

  dummy() async {
    // IwDataTable dataTable = IwDataTable();
    // dataTable.description = List<String>.filled(52, 'placeholder');
    // dataTable.dimension = List<String>.filled(52, 'placeholder');
    // dataTable.element = List<String>.filled(52, 'placeholder');
    // dataTable.noKlausul = List<String>.filled(52, 'placeholder');
    // int i = 0;
    // dataTable.id = List<int>.filled(52, i++);
    // var data = dataTable.toMap();
    int i = 14;
    firestore = FirebaseFirestore.instance;
    AuditTableData tableData = AuditTableData();
    tableData.description = List<String>.filled(i, 'placeholder');
    tableData.guidance = List<String>.filled(i, 'placeholder');
    tableData.id = List<int>.generate(i, (index) => index);
    tableData.noKlause = List<String>.filled(i, 'placeholder');
    tableData.objectiveEvidence = List<String>.filled(i, 'placeholder');
    tableData.pic = List<String>.filled(i, 'placeholder');
    var data = tableData.toMap();
    CollectionReference collection = firestore.collection('checklist_audit');
    await collection
        .doc('mspp')
        .collection('periodic_service_plan')
        .doc('compile_and_compute_data')
        .set(data);
  }

  //menampilkan dialog
  showDialog({required String title, required String middleText}) {
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
