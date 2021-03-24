import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/data_customer.dart';
import 'package:customer/models/total_product.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoController extends GetxController {
  static CustomerInfoController to = Get.find();

  final LoginController _loginController = LoginController.to;
  final DatabaseProvider _databaseProvider = DatabaseProvider();

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
  RxInt radioIndex = 1.obs;
  //Checkbox
  RxBool checkBoxA = false.obs;
  RxBool checkBoxB = false.obs;
  RxBool checkBoxC = false.obs;

  GlobalKey<FormState> formKeyCustomer;
  GlobalKey<FormState> formKeyProduk;
  GlobalKey<FormState> formKeyOther;
  String dataCus;

  TextEditingController namaTextController;
  TextEditingController alamatTextController;
  TextEditingController misiTextController;
  TextEditingController visiTextController;
  TextEditingController csOtherTextController;
  TextEditingController tpUnitedTractorTextController;
  TextEditingController tpTrakindoTextController;
  TextEditingController tdKobelDoTextController;
  TextEditingController tpHitachiTextController;
  TextEditingController tpSunyTextController;
  TextEditingController tpOtherTextController;
  TextEditingController planBudgetTextController;
  TextEditingController problemTextController;
  TextEditingController targetTextController;

  @override
  void onInit() {
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
    super.onClose();
  }

  String radioValue() {
    String data = '';
    if (radioIndex.value == 5) {
      data = csOtherTextController.text;
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
    var formP = formKeyProduk.currentState;
    var formC = formKeyCustomer.currentState;
    var formO = formKeyOther.currentState;
    if (formC.validate() && formP.validate() && formO.validate()) {
      TotalProduct totalProduct = TotalProduct(
          unitedTractor: tpUnitedTractorTextController.text,
          trakindo: tpTrakindoTextController.text,
          kobelDo: tdKobelDoTextController.text,
          hitachi: tpHitachiTextController.text,
          suny: tpSunyTextController.text,
          lainnya: tpOtherTextController.text);
      DataCustomer dataCustomer = DataCustomer(
          namaCustomer: _loginController.usr.value.username,
          namaPerusahaan: namaTextController.text,
          alamatPerusahaan: alamatTextController.text,
          misiPerusahaan: misiTextController.text,
          visiPerusahaan: visiTextController.text,
          customerSegment: radioValue(),
          totalProduct: totalProduct,
          planBudget: planBudgetTextController.text,
          problem: problemTextController.text,
          target: targetTextController.text,
          ketidakpuasan: checkBoxValue());
      _databaseProvider.saveData(dataCustomer);
      clearText();
    }
  }

  void clearText() {
    namaTextController.clear();
    alamatTextController.clear();
    misiTextController.clear();
    visiTextController.clear();
    csOtherTextController.clear();
    tpUnitedTractorTextController.clear();
    tpTrakindoTextController.clear();
    tdKobelDoTextController.clear();
    tpHitachiTextController.clear();
    tpSunyTextController.clear();
    tpOtherTextController.clear();
    planBudgetTextController.clear();
    problemTextController.clear();
    targetTextController.clear();
  }
}
