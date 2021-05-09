import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/initial_data.dart';
import 'package:customer/models/audit_table_data.dart';
import 'package:customer/models/checklist_audit/checklist_audit.dart';
import 'package:customer/models/checklist_audit/checklist_element.dart';
import 'package:customer/models/checklist_audit/list_checklist_audit.dart';
import 'package:customer/models/improve_process.dart';
import 'package:customer/models/model_unit.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/models/other_program.dart';
import 'package:customer/models/part_program.dart';
import 'package:customer/models/pica_data.dart';
import 'package:customer/models/support_ut.dart';
import 'package:customer/models/users.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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

  savePartProgram(PartProgram partProgram, String username) {
    firestore = FirebaseFirestore.instance;
    var data = partProgram.toMap();
    DocumentReference doc = firestore.collection('data_customer').doc(username);
    CollectionReference collection = doc.collection('service_program');
    collection.get().then((value) {
      collection.doc('part_program').set(data).then((_) =>
          showDialog(title: "Sukses", middleText: "Data berhasil dimasukkan"));
    });
  }

  Future<Mspp> loadMsppData(String username) async {
    Mspp mspp = Mspp();
    try {
      firestore = FirebaseFirestore.instance;
      DocumentReference doc =
          firestore.collection('data_customer').doc(username);
      CollectionReference collection = doc.collection('service_program');
      var data = await collection.doc('mspp').get();
      if (data.exists) {
        mspp = Mspp.fromMap(data.data());
      }
    } catch (e) {}
    return mspp;
  }

  //load other program data from database
  Future<OtherProgram> loadOtherProgramData(String username) async {
    OtherProgram otherProgram = OtherProgram();
    try {
      firestore = FirebaseFirestore.instance;
      DocumentReference doc =
          firestore.collection('data_customer').doc(username);
      CollectionReference collection = doc.collection('service_program');
      var data = await collection.doc('other_program').get();
      if (data.exists) {
        otherProgram = OtherProgram.fromMap(data.data());
      }
    } catch (e) {}
    return otherProgram;
  }

  Future<PartProgram> loadPartProgramController(String username) async {
    PartProgram partProgram = PartProgram();
    try {
      firestore = FirebaseFirestore.instance;
      DocumentReference doc =
          firestore.collection('data_customer').doc(username);
      CollectionReference collection = doc.collection('service_program');
      var data = await collection.doc('part_program').get();
      if (data.exists) {
        partProgram = PartProgram.fromMap(data.data());
      }
    } on FirebaseException catch (e) {
      print(e);
    }
    return partProgram;
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

  Future<bool> savePicaData(PicaData picaData, String username) async {
    bool isSuccess = false;
    try {
      var pica = picaData.toMap();
      firestore = FirebaseFirestore.instance;
      DocumentReference doc =
          firestore.collection('data_customer').doc(username);
      CollectionReference collection = doc.collection('pica_analysis');
      var data = await collection.doc('pica_observasi').set(pica).then((_) {
        isSuccess = true;
      });
    } catch (e) {}
    return isSuccess;
  }

  Future<PicaData> loadPicaData(String username) async {
    PicaData picaData;
    try {
      firestore = FirebaseFirestore.instance;
      DocumentReference doc =
          firestore.collection('data_customer').doc(username);
      var data =
          await doc.collection('pica_analysis').doc('pica_observasi').get();
      if (data.exists) {
        picaData = PicaData.fromMap(data.data());
      } else {
        DocumentReference doc =
            firestore.collection('initial_data').doc('pica_observation_t');
        var data = await doc.get();
        picaData = PicaData.fromMap(data.data());
      }
    } catch (e) {}
    return picaData;
  }

  Future<ModelUnit> loadModelUnit() async {
    ModelUnit unit;
    try {
      firestore = FirebaseFirestore.instance;
      var data =
          await firestore.collection('initial_data').doc('model_unit').get();
      unit = ModelUnit.fromMap(data.data());
    } catch (e) {
      print(e);
    }
    return unit;
  }

  Future loadImproveProcessData(String username) async {
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
        IpData ipData = IpData.fromMap(data);
        ipData.id = doc.id;
        improveProcess.improveProcesData.add(ipData);
      }
    } on FirebaseException catch (e) {
      print(e);
    }
    return improveProcess;
  }

  Future<bool> saveImproveProcessData(
      IpData data, String username, String docName) async {
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

  Future<String> uploadImproveProcessImage(
      File image, String filename, String username) async {
    String downloadUrl;
    try {
      if (image.existsSync()) {
        var task = await firebase_storage.FirebaseStorage.instance
            .ref("improve_process/" + username)
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
      IpData data, String username, String docName) async {
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

  Future<bool> deleteImproveProcess({IpData ipData, String username}) async {
    bool isDeleted = false;
    firestore = FirebaseFirestore.instance;
    try {
      DocumentReference docRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('improve_process')
          .doc(ipData.id);
      if (ipData.picturePathBefore != null) {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(ipData.picturePathBefore)
            .delete();
      }
      if (ipData.picturePathAfter != null) {
        await firebase_storage.FirebaseStorage.instance
            .refFromURL(ipData.picturePathAfter)
            .delete();
      }
      await docRef.delete();
      isDeleted = true;
    } on FirebaseException catch (e) {
      print(e);
    }
    return isDeleted;
  }

  Future<ListChecklistAudit> loadCheckListData(
      {String username, String part}) async {
    firestore = FirebaseFirestore.instance;
    ListChecklistAudit listChecklistAudit = ListChecklistAudit();
    ChecklistAudit checklistAudit = ChecklistAudit();
    try {
      CollectionReference colRef;
      colRef = firestore
          .collection('data_customer')
          .doc(username)
          .collection('checklist_audit');
      DocumentSnapshot checkData =
          await colRef.doc('periodic_inspection').get();
      QuerySnapshot data;
      if (!checkData.exists) {
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
        checklistAudit = ChecklistAudit.fromMap(data.docs[i].data());
        List<ChecklistElement> tempB = [];
        QuerySnapshot dataB =
            await colRef.doc(data.docs[i].id).collection('element').get();
        for (int j = 0; j <= dataB.docs.length - 1; j++) {
          tempB.add(ChecklistElement.fromMap(dataB.docs[j].data()));
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

  testMspp(String username) {
    firestore = FirebaseFirestore.instance;
    ListChecklistAudit listChecklistAudit = ListChecklistAudit();
    ChecklistElement checklistElement = ChecklistElement();

    try {
      CollectionReference colRef = firestore
          .collection('initial_data')
          .doc('checklist_audit')
          .collection('data');
      var initialData = initialDataMspp();
      listChecklistAudit = ListChecklistAudit.fromJson(initialData);
      DocumentReference docRefA;
      DocumentReference docRefB;
      var temp;
      for (int i = 0; i <= listChecklistAudit.checklistAudit.length - 1; i++) {
        docRefA = colRef.doc(listChecklistAudit.checklistAudit[i].id);
        docRefA.set(listChecklistAudit.checklistAudit[i].toMap());
        for (int j = 0;
            j <=
                listChecklistAudit.checklistAudit[i].checklistElement.length -
                    1;
            j++) {
          temp =
              listChecklistAudit.checklistAudit[i].checklistElement[j].toMap();
          checklistElement = ChecklistElement.fromMap(temp);
          docRefB = colRef
              .doc(listChecklistAudit.checklistAudit[i].id)
              .collection('element')
              .doc(checklistElement.id);
          docRefB.set(checklistElement.toMap());
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  // loadInitialData() async {
  //   firestore = FirebaseFirestore.instance;
  //   DocumentReference doc =
  //       firestore.collection('initial_data').doc('pica_observation_t');
  //   var data =
  //       await doc.set(initialData().toMap()).then((value) => print('done'));
  // }

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
