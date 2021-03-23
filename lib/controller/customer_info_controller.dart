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
  RxString dropdown = ''.obs;
  final List<String> listCustomerSegment = [
    'Rental',
    'Contractor Mining',
    'Contractor Maintenance Road',
    'Hauling',
    'Agro',
    'Other'
  ];

  GlobalKey<FormState> formKeyCustomer;
  GlobalKey<FormState> formKeyProduk;
  GlobalKey<FormState> formKeyOther;
  String dataCus;

  TextEditingController namaTextController;
  TextEditingController alamatTextController;
  TextEditingController misiTextController;
  TextEditingController visiTextController;
  TextEditingController customerSegmentTextController;
  TextEditingController tpUnitedTractorTextController;
  TextEditingController tpTrakindoTextController;
  TextEditingController tdKobelDoTextController;
  TextEditingController tpHitachiTextController;
  TextEditingController tpSunyTextController;
  TextEditingController tpOtherTextController;
  TextEditingController planBudgetTextController;
  TextEditingController problemTextController;
  TextEditingController targetTextController;
  TextEditingController ketidakpuasanTextController;

  @override
  void onInit() {
    dropdown.value = '';
    namaTextController = TextEditingController();
    alamatTextController = TextEditingController();
    misiTextController = TextEditingController();
    visiTextController = TextEditingController();
    customerSegmentTextController = TextEditingController();
    tpUnitedTractorTextController = TextEditingController();
    tpTrakindoTextController = TextEditingController();
    tdKobelDoTextController = TextEditingController();
    tpHitachiTextController = TextEditingController();
    tpSunyTextController = TextEditingController();
    tpOtherTextController = TextEditingController();
    planBudgetTextController = TextEditingController();
    problemTextController = TextEditingController();
    targetTextController = TextEditingController();
    ketidakpuasanTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaTextController?.dispose();
    alamatTextController?.dispose();
    misiTextController?.dispose();
    visiTextController?.dispose();
    customerSegmentTextController?.dispose();
    tpUnitedTractorTextController?.dispose();
    tpTrakindoTextController?.dispose();
    tdKobelDoTextController?.dispose();
    tpHitachiTextController?.dispose();
    tpSunyTextController?.dispose();
    tpOtherTextController?.dispose();
    planBudgetTextController?.dispose();
    problemTextController?.dispose();
    targetTextController?.dispose();
    ketidakpuasanTextController?.dispose();
    dropdown.value = '';
    super.onClose();
  }

  String dropdownValue() {
    String data = dropdown.value;
    if (data == '') {
      return 'Customer Segment';
    } else {
      return data;
    }
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
          customerSegment: customerSegmentTextController.text,
          totalProduct: totalProduct,
          planBudget: planBudgetTextController.text,
          problem: problemTextController.text,
          target: targetTextController.text,
          ketidakpuasan: ["placeholder"]);
      _databaseProvider.saveData(dataCustomer);
    }
  }
}
