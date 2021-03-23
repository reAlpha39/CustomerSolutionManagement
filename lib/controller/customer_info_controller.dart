import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoController extends GetxController {
  static CustomerInfoController to = Get.find();

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
}
