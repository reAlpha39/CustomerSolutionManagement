import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/support_ut.dart';
import 'package:customer/models/total_product.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoController extends GetxController {
  final LoginController _loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final HomeController _homeController = Get.find();

  //Dropdown
  final List<String> listCustomerSegment = [
    'Rental',
    'Contractor Mining',
    'Contractor Maintenance Road',
    'Hauling',
    'Agro',
    'Other'
  ];

  //RadioButton
  RxInt radioIndex = 0.obs;
  //Checkbox
  RxBool checkBoxA = false.obs;
  RxBool checkBoxB = false.obs;
  RxBool checkBoxC = false.obs;

  GlobalKey<FormState>? formKeyCustomer;
  GlobalKey<FormState>? formKeyProduk;
  GlobalKey<FormState>? formKeyOther;

  TextEditingController? namaTextController;
  TextEditingController? alamatTextController;
  TextEditingController? misiTextController;
  TextEditingController? visiTextController;
  TextEditingController? csOtherTextController;
  TextEditingController? tpUnitedTractorTextController;
  TextEditingController? tpTrakindoTextController;
  TextEditingController? tdKobelDoTextController;
  TextEditingController? tpHitachiTextController;
  TextEditingController? tpSunyTextController;
  TextEditingController? tpOtherTextController;
  TextEditingController? planBudgetTextController;
  TextEditingController? problemTextController;
  TextEditingController? targetTextController;
  TextEditingController? levelTextEditingController;

  RxList<SupportUt> listSupportUt = RxList<SupportUt>();

  @override
  void onInit() {
    _loadSupportUtData();
    namaTextController = TextEditingController();
    alamatTextController = TextEditingController();
    misiTextController = TextEditingController();
    visiTextController = TextEditingController();
    csOtherTextController = TextEditingController();
    tpUnitedTractorTextController = TextEditingController();
    tpTrakindoTextController = TextEditingController();
    tdKobelDoTextController = TextEditingController();
    tpHitachiTextController = TextEditingController();
    tpSunyTextController = TextEditingController();
    tpOtherTextController = TextEditingController();
    planBudgetTextController = TextEditingController();
    problemTextController = TextEditingController();
    targetTextController = TextEditingController();
    levelTextEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaTextController?.dispose();
    alamatTextController?.dispose();
    misiTextController?.dispose();
    visiTextController?.dispose();
    csOtherTextController?.dispose();
    tpUnitedTractorTextController?.dispose();
    tpTrakindoTextController?.dispose();
    tdKobelDoTextController?.dispose();
    tpHitachiTextController?.dispose();
    tpSunyTextController?.dispose();
    tpOtherTextController?.dispose();
    planBudgetTextController?.dispose();
    problemTextController?.dispose();
    targetTextController?.dispose();
    levelTextEditingController?.dispose();
    super.onClose();
  }

  void fillData(int index) {
    namaTextController!.text = listSupportUt[index].namaPerusahaan!;
    alamatTextController!.text = listSupportUt[index].alamatPerusahaan!;
    misiTextController!.text = listSupportUt[index].misiPerusahaan!;
    visiTextController!.text = listSupportUt[index].visiPerusahaan!;
    tpUnitedTractorTextController!.text =
        listSupportUt[index].totalProduct!.unitedTractor!;
    tpTrakindoTextController!.text =
        listSupportUt[index].totalProduct!.trakindo!;
    tdKobelDoTextController!.text = listSupportUt[index].totalProduct!.kobelDo!;
    tpHitachiTextController!.text = listSupportUt[index].totalProduct!.hitachi!;
    tpSunyTextController!.text = listSupportUt[index].totalProduct!.suny!;
    tpOtherTextController!.text = listSupportUt[index].totalProduct!.lainnya!;
    planBudgetTextController!.text = listSupportUt[index].planBudget!;
    problemTextController!.text = listSupportUt[index].problem!;
    targetTextController!.text = listSupportUt[index].target!;
    levelTextEditingController!.text = listSupportUt[index].level!;

    if (listCustomerSegment.contains(listSupportUt[index].customerSegment!)) {
      radioIndex.value = listCustomerSegment.indexWhere(
          (element) => element == listSupportUt[index].customerSegment!);
      print(radioIndex.value);
    } else {
      radioIndex.value = 5;
      csOtherTextController!.text = listSupportUt[index].customerSegment!;
    }

    checkBoxA.value = listSupportUt[index].ketidakpuasan!.contains("Produk");
    checkBoxB.value = listSupportUt[index].ketidakpuasan!.contains("Service");
    checkBoxC.value = listSupportUt[index].ketidakpuasan!.contains("Part");
  }

  void _loadSupportUtData() async {
    if (_loginController.usr.value.type == "internal") {
      bool isConnected = false;
      showProgressDialog();
      isConnected = await connectivityChecker();
      if (isConnected) {
        listSupportUt.value = await _databaseProvider
            .loadSupportUt(_homeController.idCustomer.value);
        listSupportUt.refresh();
        _closeCurrentDialog();
      }
    }
  }

  String radioValue() {
    String data = '';
    if (radioIndex.value == 5) {
      data = csOtherTextController!.text;
    } else {
      data = listCustomerSegment[radioIndex.value];
    }
    return data;
  }

  List<String> checkBoxValue() {
    List<String> data = [];
    if (checkBoxA.value) {
      data.add('Produk');
    }
    if (checkBoxB.value) {
      data.add('Service');
    }
    if (checkBoxC.value) {
      data.add('Part');
    }
    return data;
  }

  void validateTextField() {
    _closeCurrentDialog();
    showProgressDialog();
    connectivityChecker().then((conn) {
      if (conn) {
        var formP = formKeyProduk!.currentState;
        var formC = formKeyCustomer!.currentState!;
        var formO = formKeyOther!.currentState;
        if (formC.validate() && formP!.validate() && formO!.validate()) {
          TotalProduct totalProduct = TotalProduct(
            unitedTractor: tpUnitedTractorTextController!.text,
            trakindo: tpTrakindoTextController!.text,
            kobelDo: tdKobelDoTextController!.text,
            hitachi: tpHitachiTextController!.text,
            suny: tpSunyTextController!.text,
            lainnya: tpOtherTextController!.text,
          );
          SupportUt dataCustomer = SupportUt(
            namaCustomer: _loginController.usr.value.username,
            namaPerusahaan: namaTextController!.text,
            alamatPerusahaan: alamatTextController!.text,
            misiPerusahaan: misiTextController!.text,
            visiPerusahaan: visiTextController!.text,
            customerSegment: radioValue(),
            totalProduct: totalProduct,
            planBudget: planBudgetTextController!.text,
            problem: problemTextController!.text,
            target: targetTextController!.text,
            level: levelTextEditingController!.text,
            ketidakpuasan: checkBoxValue(),
          );
          _databaseProvider.saveData(dataCustomer);
          clearText();
        }
      }
    });
    _closeCurrentDialog();
  }

  void _closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  void clearText() {
    namaTextController!.clear();
    alamatTextController!.clear();
    misiTextController!.clear();
    visiTextController!.clear();
    csOtherTextController!.clear();
    tpUnitedTractorTextController!.clear();
    tpTrakindoTextController!.clear();
    tdKobelDoTextController!.clear();
    tpHitachiTextController!.clear();
    tpSunyTextController!.clear();
    tpOtherTextController!.clear();
    planBudgetTextController!.clear();
    problemTextController!.clear();
    targetTextController!.clear();
    levelTextEditingController!.clear();
    radioIndex.value = 0;
    checkBoxA.value = false;
    checkBoxB.value = false;
    checkBoxC.value = false;
  }
}
