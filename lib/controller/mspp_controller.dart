import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
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
  RxList<int> radioIndexCCCD = RxList.filled(7, -1);
  RxList<int> radioIndexOPOP = RxList.filled(2, -1);
  RxList<int> radioIndexBSOP = RxList.filled(4, -1);
  RxList<int> radioIndexRCOP = RxList.filled(8, -1);
  RxList<int> radioIndexAME = RxList.filled(3, -1);
  RxList<int> radioIndexPL = RxList.filled(1, -1);
  RxList<int> radioIndexAR = RxList.filled(4, -1);
  RxList<int> radioIndexNT = RxList.filled(2, -1);
  RxList<int> radioIndexTR = RxList.filled(13, -1);
  RxList<int> radioIndexHPS = RxList.filled(1, -1);
  RxList<int> radioIndexEJ = RxList.filled(6, -1);
  RxList<int> radioIndexRE = RxList.filled(2, -1);
  RxList<int> radioIndexTO = RxList.filled(4, -1);
  RxList<int> radioIndexIUIP = RxList.filled(8, -1);
  RxList<int> radioIndexGAR = RxList.filled(3, -1);
  RxList<int> radioIndexEDR = RxList.filled(2, -1);
  RxList<int> radioIndexRJ = RxList.filled(3, -1);
  RxList<int> radioIndexCTST = RxList.filled(8, -1);
  RxList<int> radioIndexMTDT = RxList.filled(1, -1);
  RxList<int> radioIndexPLCBM = RxList.filled(5, -1);
  RxList<int> radioIndexARCBM = RxList.filled(5, -1);
  RxList<int> radioIndexTACBM = RxList.filled(6, -1);
  RxList<int> radioIndexEVCBM = RxList.filled(1, -1);
  RxList<int> radioIndexFIELD = RxList.filled(14, -1);
  RxList<int> radioIndexWORKSHOP = RxList.filled(26, -1);
  RxList<int> radioIndexAEA = RxList.filled(4, -1);
  RxList<int> radioIndexAEB = RxList.filled(4, -1);
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
  RxList<String> textFieldCCCD = RxList.filled(7, "");
  RxList<String> textFieldOPOP = RxList.filled(2, "");
  RxList<String> textFieldBSOP = RxList.filled(4, "");
  RxList<String> textFieldRCOP = RxList.filled(8, "");
  RxList<String> textFieldAME = RxList.filled(3, "");
  RxList<String> textFieldPL = RxList.filled(1, "");
  RxList<String> textFieldAR = RxList.filled(4, "");
  RxList<String> textFieldNT = RxList.filled(2, "");
  RxList<String> textFieldTR = RxList.filled(13, "");
  RxList<String> textFieldHPS = RxList.filled(1, "");
  RxList<String> textFieldEJ = RxList.filled(6, "");
  RxList<String> textFieldRE = RxList.filled(2, "");
  RxList<String> textFieldTO = RxList.filled(4, "");
  RxList<String> textFieldIUIP = RxList.filled(8, "");
  RxList<String> textFieldGAR = RxList.filled(3, "");
  RxList<String> textFieldEDR = RxList.filled(2, "");
  RxList<String> textFieldRJ = RxList.filled(3, "");
  RxList<String> textFieldCTST = RxList.filled(8, "");
  RxList<String> textFieldMTDT = RxList.filled(1, "");
  RxList<String> textFieldPLCBM = RxList.filled(5, "");
  RxList<String> textFieldARCBM = RxList.filled(5, "");
  RxList<String> textFieldTACBM = RxList.filled(6, "");
  RxList<String> textFieldEVCBM = RxList.filled(1, "");
  RxList<String> textFieldFIELD = RxList.filled(14, "");
  RxList<String> textFieldWORKSHOP = RxList.filled(26, "");
  RxList<String> textFieldAEA = RxList.filled(4, "");
  RxList<String> textFieldAEB = RxList.filled(4, "");
  RxList<String> textFieldKM = RxList.filled(4, "");
  RxList<String> textFieldLTPP = RxList.filled(4, "");

  Map<int, String> radioData = {
    0: 'Yes',
    1: 'No',
    2: 'N/A',
  };

  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;

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
    final PicaCardTableController picaCardTableController = Get.find(tag: 'global');
    isLoading.value = true;
    connectivityChecker().then((conn) {
      if (conn) {
        picaCardTableController.loadPicaData(username: username);
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
              radioIndexCCCD.assignAll(value.ovhPlan['cccd'].assessmentResult);
              radioIndexOPOP.assignAll(value.ovhPlan['opop'].assessmentResult);
              radioIndexBSOP.assignAll(value.ovhPlan['bsop'].assessmentResult);
              radioIndexRCOP.assignAll(value.ovhPlan['rcop'].assessmentResult);
              radioIndexAME.assignAll(value.ovhPlan['ame'].assessmentResult);
              radioIndexPL.assignAll(value.ovh['pl'].assessmentResult);
              radioIndexAR.assignAll(value.ovh['ar'].assessmentResult);
              radioIndexNT.assignAll(value.ovh['nt'].assessmentResult);
              radioIndexTR.assignAll(value.ovh['tr'].assessmentResult);
              radioIndexHPS.assignAll(value.ovh['hps'].assessmentResult);
              radioIndexEJ.assignAll(value.ovh['ej'].assessmentResult);
              radioIndexRE.assignAll(value.ovh['re'].assessmentResult);
              radioIndexIUIP
                  .assignAll(value.unscheduleBreakdown['to'].assessmentResult);
              radioIndexTO.assignAll(
                  value.unscheduleBreakdown['iuip'].assessmentResult);
              radioIndexEDR
                  .assignAll(value.unscheduleBreakdown['gar'].assessmentResult);
              radioIndexGAR
                  .assignAll(value.unscheduleBreakdown['edr'].assessmentResult);
              radioIndexRJ
                  .assignAll(value.unscheduleBreakdown['rj'].assessmentResult);
              radioIndexPLCBM.assignAll(value.cbm['plcbm'].assessmentResult);
              radioIndexARCBM.assignAll(value.cbm['arcbm'].assessmentResult);
              radioIndexTACBM.assignAll(value.cbm['tacbm'].assessmentResult);
              radioIndexEVCBM.assignAll(value.cbm['evcbm'].assessmentResult);
              radioIndexAEA
                  .assignAll(value.applicationEngineer['aea'].assessmentResult);
              radioIndexAEB
                  .assignAll(value.applicationEngineer['aeb'].assessmentResult);
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
              textFieldCCCD.assignAll(value.ovhPlan['cccd'].remark);
              textFieldOPOP.assignAll(value.ovhPlan['opop'].remark);
              textFieldBSOP.assignAll(value.ovhPlan['bsop'].remark);
              textFieldRCOP.assignAll(value.ovhPlan['rcop'].remark);
              textFieldAME.assignAll(value.ovhPlan['ame'].remark);
              textFieldPL.assignAll(value.ovh['pl'].remark);
              textFieldAR.assignAll(value.ovh['ar'].remark);
              textFieldNT.assignAll(value.ovh['nt'].remark);
              textFieldTR.assignAll(value.ovh['tr'].remark);
              textFieldHPS.assignAll(value.ovh['hps'].remark);
              textFieldEJ.assignAll(value.ovh['ej'].remark);
              textFieldRE.assignAll(value.ovh['re'].remark);
              textFieldIUIP.assignAll(value.unscheduleBreakdown['to'].remark);
              textFieldTO.assignAll(value.unscheduleBreakdown['iuip'].remark);
              textFieldEDR.assignAll(value.unscheduleBreakdown['gar'].remark);
              textFieldGAR.assignAll(value.unscheduleBreakdown['edr'].remark);
              textFieldRJ.assignAll(value.unscheduleBreakdown['rj'].remark);
              textFieldPLCBM.assignAll(value.cbm['plcbm'].remark);
              textFieldARCBM.assignAll(value.cbm['arcbm'].remark);
              textFieldTACBM.assignAll(value.cbm['tacbm'].remark);
              textFieldEVCBM.assignAll(value.cbm['evcbm'].remark);
              textFieldAEA.assignAll(value.applicationEngineer['aea'].remark);
              textFieldAEB.assignAll(value.applicationEngineer['aeb'].remark);
              isLoading.value = false;
              isLoaded.value = true;
            } else {
              isLoading.value = false;
            }
          },
        );
      } else {
        isLoading.value = false;
      }
    });
  }

  dummy() {
    _databaseProvider.dummy();
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
      MsppData msppDataCCCD =
          MsppData(assessmentResult: radioIndexCCCD, remark: textFieldCCCD);
      MsppData msppDataOPOP =
          MsppData(assessmentResult: radioIndexOPOP, remark: textFieldOPOP);
      MsppData msppDataBSOP =
          MsppData(assessmentResult: radioIndexBSOP, remark: textFieldBSOP);
      MsppData msppDataRCOP =
          MsppData(assessmentResult: radioIndexRCOP, remark: textFieldRCOP);
      MsppData msppDataAME =
          MsppData(assessmentResult: radioIndexAME, remark: textFieldAME);
      MsppData msppDataPL =
          MsppData(assessmentResult: radioIndexPL, remark: textFieldPL);
      MsppData msppDataAR =
          MsppData(assessmentResult: radioIndexAR, remark: textFieldAR);
      MsppData msppDataNT =
          MsppData(assessmentResult: radioIndexNT, remark: textFieldNT);
      MsppData msppDataTR =
          MsppData(assessmentResult: radioIndexTR, remark: textFieldTR);
      MsppData msppDataHPS =
          MsppData(assessmentResult: radioIndexHPS, remark: textFieldHPS);
      MsppData msppDataEJ =
          MsppData(assessmentResult: radioIndexEJ, remark: textFieldEJ);
      MsppData msppDataRE =
          MsppData(assessmentResult: radioIndexRE, remark: textFieldRE);
      MsppData msppDataTO =
          MsppData(assessmentResult: radioIndexTO, remark: textFieldTO);
      MsppData msppDataIUIP =
          MsppData(assessmentResult: radioIndexIUIP, remark: textFieldIUIP);
      MsppData msppDataGAR =
          MsppData(assessmentResult: radioIndexGAR, remark: textFieldGAR);
      MsppData msppDataEDR =
          MsppData(assessmentResult: radioIndexEDR, remark: textFieldEDR);
      MsppData msppDataRJ =
          MsppData(assessmentResult: radioIndexRJ, remark: textFieldRJ);
      MsppData msppDataPLCBM =
          MsppData(assessmentResult: radioIndexPLCBM, remark: textFieldPLCBM);
      MsppData msppDataARCBM =
          MsppData(assessmentResult: radioIndexARCBM, remark: textFieldARCBM);
      MsppData msppDataTACBM =
          MsppData(assessmentResult: radioIndexTACBM, remark: textFieldTACBM);
      MsppData msppDataEVCBM =
          MsppData(assessmentResult: radioIndexEVCBM, remark: textFieldEVCBM);
      MsppData msppDataAEA =
          MsppData(assessmentResult: radioIndexAEA, remark: textFieldAEA);
      MsppData msppDataAEB =
          MsppData(assessmentResult: radioIndexAEB, remark: textFieldAEB);

      Mspp mspp = Mspp(
        periodicInspection: {
          'planUnit': msppDataPU,
          'meet': msppDataMeet,
          'assess': msppDataAsses,
        },
        periodicServicePlan: {
          'ccd': msppDataCCD,
          'oppsp': msppDataOPPSP,
          'bspsp': msppDataBSPSP,
          'rcpsp': msppDataRCPSP,
          'ade': msppDataADE,
        },
        periodicService: {
          'pps': msppDataPPS,
          'appt': msppDataAPPT,
          'epss': msppDataEPSS,
          'tpsnp': msppDataTPSNP,
          'hptd': msppDataHPTD,
          'eds': msppDataEDS,
          'rpll': msppDataRPLL,
        },
        tools: {
          'ctst': msppDataCTST,
          'mtdt': msppDataMTDT,
        },
        infrastructur: {
          'field': msppDataFIELD,
          'workshop': msppDataWORKSHOP,
        },
        ketersediaanMekanik: {
          'km': msppDataKM,
        },
        leadTimePenyelesaianP: {
          'ltpp': msppDataLTPP,
        },
        ovhPlan: {
          'cccd': msppDataCCCD,
          'opop': msppDataOPOP,
          'bsop': msppDataBSOP,
          'rcop': msppDataRCOP,
          'ame': msppDataAME,
        },
        ovh: {
          'pl': msppDataPL,
          'ar': msppDataAR,
          'nt': msppDataNT,
          'tr': msppDataTR,
          'hps': msppDataHPS,
          'ej': msppDataEJ,
          're': msppDataRE,
        },
        unscheduleBreakdown: {
          'to': msppDataTO,
          'iuip': msppDataIUIP,
          'gar': msppDataGAR,
          'edr': msppDataEDR,
          'rj': msppDataRJ,
        },
        cbm: {
          'plcbm': msppDataPLCBM,
          'arcbm': msppDataARCBM,
          'tacbm': msppDataTACBM,
          'evcbm': msppDataEVCBM,
        },
        applicationEngineer: {
          'aea': msppDataAEA,
          'aeb': msppDataAEB,
        },
      );
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
      case 'cccd':
        data = textFieldCCCD;
        break;
      case 'opop':
        data = textFieldOPOP;
        break;
      case 'bsop':
        data = textFieldBSOP;
        break;
      case 'rcop':
        data = textFieldRCOP;
        break;
      case 'ame':
        data = textFieldAME;
        break;
      case 'pl':
        data = textFieldPL;
        break;
      case 'ar':
        data = textFieldAR;
        break;
      case 'nt':
        data = textFieldNT;
        break;
      case 'tr':
        data = textFieldTR;
        break;
      case 'hps':
        data = textFieldHPS;
        break;
      case 'ej':
        data = textFieldEJ;
        break;
      case 're':
        data = textFieldRE;
        break;
      case 'to':
        data = textFieldTO;
        break;
      case 'iuip':
        data = textFieldIUIP;
        break;
      case 'gar':
        data = textFieldGAR;
        break;
      case 'edr':
        data = textFieldEDR;
        break;
      case 'rj':
        data = textFieldRJ;
        break;
      case 'plcbm':
        data = textFieldPLCBM;
        break;
      case 'arcbm':
        data = textFieldARCBM;
        break;
      case 'tacbm':
        data = textFieldTACBM;
        break;
      case 'evcbm':
        data = textFieldEVCBM;
        break;
      case 'aea':
        data = textFieldAEA;
        break;
      case 'aeb':
        data = textFieldAEB;
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
      case 'cccd':
        data = radioIndexCCCD;
        break;
      case 'opop':
        data = radioIndexOPOP;
        break;
      case 'bsop':
        data = radioIndexBSOP;
        break;
      case 'rcop':
        data = radioIndexRCOP;
        break;
      case 'ame':
        data = radioIndexAME;
        break;
      case 'pl':
        data = radioIndexPL;
        break;
      case 'ar':
        data = radioIndexAR;
        break;
      case 'nt':
        data = radioIndexNT;
        break;
      case 'tr':
        data = radioIndexTR;
        break;
      case 'hps':
        data = radioIndexHPS;
        break;
      case 'ej':
        data = radioIndexEJ;
        break;
      case 're':
        data = radioIndexRE;
        break;
      case 'to':
        data = radioIndexTO;
        break;
      case 'iuip':
        data = radioIndexIUIP;
        break;
      case 'gar':
        data = radioIndexGAR;
        break;
      case 'edr':
        data = radioIndexEDR;
        break;
      case 'rj':
        data = radioIndexRJ;
        break;
      case 'plcbm':
        data = radioIndexPLCBM;
        break;
      case 'arcbm':
        data = radioIndexARCBM;
        break;
      case 'tacbm':
        data = radioIndexTACBM;
        break;
      case 'evcbm':
        data = radioIndexEVCBM;
        break;
      case 'aea':
        data = radioIndexAEA;
        break;
      case 'aeb':
        data = radioIndexAEB;
        break;
      default:
    }
    return data;
  }
}
