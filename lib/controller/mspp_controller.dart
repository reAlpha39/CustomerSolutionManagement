import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/mspp.dart';
import 'package:customer/models/mspp_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppController extends GetxController {
  final LoginController _loginController = Get.find();
  final DatabaseProvider _databaseProvider = DatabaseProvider();

  //RadioButton
  RxList<int> radioIndexPU = RxList.filled(5, -1);
  RxList<int> radioIndexMeet = RxList.filled(2, -1);
  RxList<int> radioIndexAsses = RxList.filled(6, -1);
  RxList<int> radioIndexCCD = RxList.filled(14, -1);
  RxList<int> radioIndexOPPSP = RxList.filled(3, -1);
  RxList<int> radioIndexBSPSP = RxList.filled(2, -1);
  RxList<int> radioIndexRCPSP = RxList.filled(5, -1);
  RxList<int> radioIndexADE = RxList.filled(6, -1);
  RxList<int> radioIndexPPS = RxList.filled(3, -1);
  RxList<int> radioIndexAPPT = RxList.filled(5, -1);
  RxList<int> radioIndexEPSS = RxList.filled(7, -1);
  RxList<int> radioIndexTPSNP = RxList.filled(4, -1);
  RxList<int> radioIndexHPTD = RxList.filled(5, -1);
  RxList<int> radioIndexEDS = RxList.filled(3, -1);
  RxList<int> radioIndexRPLL = RxList.filled(2, -1);
  RxList<int> radioIndexCTST = RxList.filled(8, -1);
  RxList<int> radioIndexMTDT = RxList.filled(1, -1);
  RxList<int> radioIndexFIELD = RxList.filled(14, -1);
  RxList<int> radioIndexWORKSHOP = RxList.filled(26, -1);
  RxList<int> radioIndexKM = RxList.filled(4, -1);
  RxList<int> radioIndexLTPP = RxList.filled(4, -1);

  //Textfield data
  RxList<String> textFieldPU = RxList.filled(5, "");
  RxList<String> textFieldMeet = RxList.filled(2, "");
  RxList<String> textFieldAsses = RxList.filled(6, "");
  RxList<String> textFieldCCD = RxList.filled(14, "");
  RxList<String> textFieldOPPSP = RxList.filled(3, "");
  RxList<String> textFieldBSPSP = RxList.filled(2, "");
  RxList<String> textFieldRCPSP = RxList.filled(5, "");
  RxList<String> textFieldADE = RxList.filled(6, "");
  RxList<String> textFieldPPS = RxList.filled(3, "");
  RxList<String> textFieldAPPT = RxList.filled(5, "");
  RxList<String> textFieldEPSS = RxList.filled(7, "");
  RxList<String> textFieldTPSNP = RxList.filled(4, "");
  RxList<String> textFieldHPTD = RxList.filled(5, "");
  RxList<String> textFieldEDS = RxList.filled(3, "");
  RxList<String> textFieldRPLL = RxList.filled(2, "");
  RxList<String> textFieldCTST = RxList.filled(8, "");
  RxList<String> textFieldMTDT = RxList.filled(1, "");
  RxList<String> textFieldFIELD = RxList.filled(14, "");
  RxList<String> textFieldWORKSHOP = RxList.filled(26, "");
  RxList<String> textFieldKM = RxList.filled(4, "");
  RxList<String> textFieldLTPP = RxList.filled(4, "");

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;

  TextEditingController textEditingControllerALL;

  @override
  void onInit() {
    loadData(username: _loginController.usr.value.username);
    textEditingControllerALL = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    super.onClose();
  }

  loadData({String username}) {
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider.loadMsppData(username).then(
          (value) {
            if (value.periodicInspection != null) {
              radioIndexPU.assignAll(
                  value.periodicInspection['planUnit'].assessmentResult);
              radioIndexMeet
                  .assignAll(value.periodicInspection['meet'].assessmentResult);
              radioIndexAsses.assignAll(
                  value.periodicInspection['assess'].assessmentResult);
              radioIndexCCD
                  .assignAll(value.periodicServicePlan['ccd'].assessmentResult);
              radioIndexOPPSP.assignAll(
                  value.periodicServicePlan['oppsp'].assessmentResult);
              radioIndexBSPSP.assignAll(
                  value.periodicServicePlan['bspsp'].assessmentResult);
              radioIndexRCPSP.assignAll(
                  value.periodicServicePlan['rcpsp'].assessmentResult);
              radioIndexADE
                  .assignAll(value.periodicServicePlan['ade'].assessmentResult);
              radioIndexPPS
                  .assignAll(value.periodicService['pps'].assessmentResult);
              radioIndexAPPT
                  .assignAll(value.periodicService['appt'].assessmentResult);
              radioIndexEPSS
                  .assignAll(value.periodicService['epss'].assessmentResult);
              radioIndexTPSNP
                  .assignAll(value.periodicService['tpsnp'].assessmentResult);
              radioIndexHPTD
                  .assignAll(value.periodicService['hptd'].assessmentResult);
              radioIndexEDS
                  .assignAll(value.periodicService['eds'].assessmentResult);
              radioIndexRPLL
                  .assignAll(value.periodicService['rpll'].assessmentResult);
              radioIndexCTST.assignAll(value.tools['ctst'].assessmentResult);
              radioIndexMTDT.assignAll(value.tools['mtdt'].assessmentResult);
              radioIndexFIELD
                  .assignAll(value.infrastructur['field'].assessmentResult);
              radioIndexWORKSHOP
                  .assignAll(value.infrastructur['workshop'].assessmentResult);
              radioIndexKM
                  .assignAll(value.ketersediaanMekanik['km'].assessmentResult);
              radioIndexLTPP.assignAll(
                  value.leadTimePenyelesaianP['ltpp'].assessmentResult);
              textFieldPU
                  .assignAll(value.periodicInspection['planUnit'].remark);
              textFieldMeet.assignAll(value.periodicInspection['meet'].remark);
              textFieldAsses
                  .assignAll(value.periodicInspection['assess'].remark);
              textFieldCCD.assignAll(value.periodicServicePlan['ccd'].remark);
              textFieldOPPSP
                  .assignAll(value.periodicServicePlan['oppsp'].remark);
              textFieldBSPSP
                  .assignAll(value.periodicServicePlan['bspsp'].remark);
              textFieldRCPSP
                  .assignAll(value.periodicServicePlan['rcpsp'].remark);
              textFieldADE.assignAll(value.periodicServicePlan['ade'].remark);
              textFieldPPS.assignAll(value.periodicService['pps'].remark);
              textFieldAPPT.assignAll(value.periodicService['appt'].remark);
              textFieldEPSS.assignAll(value.periodicService['epss'].remark);
              textFieldTPSNP.assignAll(value.periodicService['tpsnp'].remark);
              textFieldHPTD.assignAll(value.periodicService['hptd'].remark);
              textFieldEDS.assignAll(value.periodicService['eds'].remark);
              textFieldRPLL.assignAll(value.periodicService['rpll'].remark);
              textFieldCTST.assignAll(value.tools['ctst'].remark);
              textFieldMTDT.assignAll(value.tools['mtdt'].remark);
              textFieldFIELD.assignAll(value.infrastructur['field'].remark);
              textFieldWORKSHOP
                  .assignAll(value.infrastructur['workshop'].remark);
              textFieldKM.assignAll(value.ketersediaanMekanik['km'].remark);
              textFieldLTPP
                  .assignAll(value.leadTimePenyelesaianP['ltpp'].remark);
            }
          },
        );
      }
      isLoading.value = false;
    });
  }

  saveDataMspp() {
    Get.back(closeOverlays: false);
    showProgressDialog();
    connectivityChecker().then((conn) {
      MsppData msppDataPU =
          MsppData(assessmentResult: radioIndexPU, remark: textFieldPU);
      MsppData msppDataMeet =
          MsppData(assessmentResult: radioIndexMeet, remark: textFieldMeet);
      MsppData msppDataAsses =
          MsppData(assessmentResult: radioIndexAsses, remark: textFieldAsses);
      MsppData msppDataCCD =
          MsppData(assessmentResult: radioIndexCCD, remark: textFieldCCD);
      MsppData msppDataOPPSP =
          MsppData(assessmentResult: radioIndexOPPSP, remark: textFieldOPPSP);
      MsppData msppDataBSPSP =
          MsppData(assessmentResult: radioIndexBSPSP, remark: textFieldBSPSP);
      MsppData msppDataRCPSP =
          MsppData(assessmentResult: radioIndexRCPSP, remark: textFieldRCPSP);
      MsppData msppDataADE =
          MsppData(assessmentResult: radioIndexADE, remark: textFieldADE);
      MsppData msppDataPPS =
          MsppData(assessmentResult: radioIndexPPS, remark: textFieldPPS);
      MsppData msppDataAPPT =
          MsppData(assessmentResult: radioIndexAPPT, remark: textFieldAPPT);
      MsppData msppDataEPSS =
          MsppData(assessmentResult: radioIndexEPSS, remark: textFieldEPSS);
      MsppData msppDataTPSNP =
          MsppData(assessmentResult: radioIndexTPSNP, remark: textFieldTPSNP);
      MsppData msppDataHPTD =
          MsppData(assessmentResult: radioIndexHPTD, remark: textFieldHPTD);
      MsppData msppDataEDS =
          MsppData(assessmentResult: radioIndexEDS, remark: textFieldEDS);
      MsppData msppDataRPLL =
          MsppData(assessmentResult: radioIndexRPLL, remark: textFieldRPLL);
      MsppData msppDataCTST =
          MsppData(assessmentResult: radioIndexCTST, remark: textFieldCTST);
      MsppData msppDataMTDT =
          MsppData(assessmentResult: radioIndexMTDT, remark: textFieldMTDT);
      MsppData msppDataFIELD =
          MsppData(assessmentResult: radioIndexFIELD, remark: textFieldFIELD);
      MsppData msppDataWORKSHOP = MsppData(
          assessmentResult: radioIndexWORKSHOP, remark: textFieldWORKSHOP);
      MsppData msppDataKM =
          MsppData(assessmentResult: radioIndexKM, remark: textFieldKM);
      MsppData msppDataLTPP =
          MsppData(assessmentResult: radioIndexLTPP, remark: textFieldLTPP);

      Mspp mspp = Mspp(periodicInspection: {
        'planUnit': msppDataPU,
        'meet': msppDataMeet,
        'assess': msppDataAsses
      }, periodicServicePlan: {
        'ccd': msppDataCCD,
        'oppsp': msppDataOPPSP,
        'bspsp': msppDataBSPSP,
        'rcpsp': msppDataRCPSP,
        'ade': msppDataADE
      }, periodicService: {
        'pps': msppDataPPS,
        'appt': msppDataAPPT,
        'epss': msppDataEPSS,
        'tpsnp': msppDataTPSNP,
        'hptd': msppDataHPTD,
        'eds': msppDataEDS,
        'rpll': msppDataRPLL
      }, tools: {
        'ctst': msppDataCTST,
        'mtdt': msppDataMTDT
      }, infrastructur: {
        'field': msppDataFIELD,
        'workshop': msppDataWORKSHOP
      }, ketersediaanMekanik: {
        'km': msppDataKM
      }, leadTimePenyelesaianP: {
        'ltpp': msppDataLTPP
      });
      _databaseProvider.saveMSPP(mspp, _loginController.usr.value.username);
    });
    Get.back(closeOverlays: false);
  }

  void showProgressDialog() {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
  }

  RxList<String> textFieldPI(String i) {
    RxList<String> data;
    switch (i) {
      case 'planUnit':
        data = textFieldPU;
        break;
      case 'meet':
        data = textFieldMeet;
        break;
      case 'asses':
        data = textFieldAsses;
        break;
      case 'ccd':
        data = textFieldCCD;
        break;
      case 'oppsp':
        data = textFieldOPPSP;
        break;
      case 'bspsp':
        data = textFieldBSPSP;
        break;
      case 'rcpsp':
        data = textFieldRCPSP;
        break;
      case 'ade':
        data = textFieldADE;
        break;
      case 'pps':
        data = textFieldPPS;
        break;
      case 'appt':
        data = textFieldAPPT;
        break;
      case 'epss':
        data = textFieldEPSS;
        break;
      case 'tpsnp':
        data = textFieldTPSNP;
        break;
      case 'hptd':
        data = textFieldHPTD;
        break;
      case 'eds':
        data = textFieldEDS;
        break;
      case 'rpll':
        data = textFieldRPLL;
        break;
      case 'ctst':
        data = textFieldCTST;
        break;
      case 'mtdt':
        data = textFieldMTDT;
        break;
      case 'field':
        data = textFieldFIELD;
        break;
      case 'workshop':
        data = textFieldWORKSHOP;
        break;
      case 'km':
        data = textFieldKM;
        break;
      case 'ltpp':
        data = textFieldLTPP;
        break;
      default:
    }
    return data;
  }

  RxList<int> radioIndexPI(String i) {
    RxList<int> data;
    switch (i) {
      case 'planUnit':
        data = radioIndexPU;
        break;
      case 'meet':
        data = radioIndexMeet;
        break;
      case 'asses':
        data = radioIndexAsses;
        break;
      case 'ccd':
        data = radioIndexCCD;
        break;
      case 'oppsp':
        data = radioIndexOPPSP;
        break;
      case 'bspsp':
        data = radioIndexBSPSP;
        break;
      case 'rcpsp':
        data = radioIndexRCPSP;
        break;
      case 'ade':
        data = radioIndexADE;
        break;
      case 'pps':
        data = radioIndexPPS;
        break;
      case 'appt':
        data = radioIndexAPPT;
        break;
      case 'epss':
        data = radioIndexEPSS;
        break;
      case 'tpsnp':
        data = radioIndexTPSNP;
        break;
      case 'hptd':
        data = radioIndexHPTD;
        break;
      case 'eds':
        data = radioIndexEDS;
        break;
      case 'rpll':
        data = radioIndexRPLL;
        break;
      case 'ctst':
        data = radioIndexCTST;
        break;
      case 'mtdt':
        data = radioIndexMTDT;
        break;
      case 'field':
        data = radioIndexFIELD;
        break;
      case 'workshop':
        data = radioIndexWORKSHOP;
        break;
      case 'km':
        data = radioIndexKM;
        break;
      case 'ltpp':
        data = radioIndexLTPP;
        break;
      default:
    }
    return data;
  }
}
