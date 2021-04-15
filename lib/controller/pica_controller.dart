import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/controller/part_program_controller.dart';
import 'package:get/get.dart';

class PicaController extends GetxController {
  MsppController _mspp = Get.find();
  OtherProgramController _other = Get.find();
  PartProgramController _part = Get.find();

  RxList<int> indexPI = RxList<int>();
  RxList<int> indexPSP = RxList<int>();
  RxList<int> indexPS = RxList<int>();
  RxList<int> indexOVHP = RxList<int>();
  RxList<int> indexOVH = RxList<int>();
  RxList<int> indexUSC = RxList<int>();
  RxList<int> indexTOOLS = RxList<int>();
  RxList<int> indexCBM = RxList<int>();
  RxList<int> indexINFRAS = RxList<int>();
  RxList<int> indexPEOPLE = RxList<int>();
  RxList<int> indexIW = RxList<int>();
  RxList<int> indexVM = RxList<int>();
  RxList<int> indexAE = RxList<int>();
  RxList<int> indexMR = RxList<int>();
  RxList<int> indexOM = RxList<int>();
  RxList<int> indexOP = RxList<int>();
  RxList<int> indexOS = RxList<int>();
  RxList<int> indexRM = RxList<int>();
  RxList<int> indexCO = RxList<int>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  scorePica(List<int> list) {
    List<int> data = filterList(list);
    double percentage = 0.0;
    double score = 0;
    try {
      score = data[0].toDouble() / (data[1].toDouble() + data[0].toDouble());
      percentage = score * 100;
    } catch (e) {}
    if (percentage.isNaN) {
      percentage = 0.1;
    }
    print('percent:' + percentage.toString() + '%');
    return percentage;
  }

  List<int> filterList(List<int> list) {
    int yes = 0;
    int no = 0;
    int na = 0;
    for (int i = 0; i <= list.length - 1; i++) {
      switch (list[i]) {
        case -1:
          na++;
          break;
        case 0:
          yes++;
          break;
        case 1:
          no++;
          break;
        case 2:
          na++;
          break;
        default:
          na++;
      }
    }
    List<int> counted = [yes, no, na];
    return counted;
  }

  combineList() {
    indexPI.assignAll(
        _mspp.radioIndexPU + _mspp.radioIndexMeet + _mspp.radioIndexAsses);
    indexPSP = _mspp.radioIndexCCD +
        _mspp.radioIndexOPPSP +
        _mspp.radioIndexBSPSP +
        _mspp.radioIndexRCPSP +
        _mspp.radioIndexADE;
    indexPS = _mspp.radioIndexPPS +
        _mspp.radioIndexAPPT +
        _mspp.radioIndexEPSS +
        _mspp.radioIndexTPSNP +
        _mspp.radioIndexHPTD +
        _mspp.radioIndexEDS +
        _mspp.radioIndexRPLL;
    indexOVHP = _mspp.radioIndexCCCD +
        _mspp.radioIndexOPOP +
        _mspp.radioIndexBSOP +
        _mspp.radioIndexRCOP +
        _mspp.radioIndexAME;
    indexOVH = _mspp.radioIndexPL +
        _mspp.radioIndexAR +
        _mspp.radioIndexNT +
        _mspp.radioIndexTR +
        _mspp.radioIndexHPS +
        _mspp.radioIndexEJ +
        _mspp.radioIndexRE;
    indexUSC = _mspp.radioIndexTO +
        _mspp.radioIndexIUIP +
        _mspp.radioIndexGAR +
        _mspp.radioIndexEDR +
        _mspp.radioIndexRJ;
    indexTOOLS = _mspp.radioIndexCTST + _mspp.radioIndexMTDT;
    indexCBM = _mspp.radioIndexPLCBM +
        _mspp.radioIndexARCBM +
        _mspp.radioIndexTACBM +
        _mspp.radioIndexEVCBM;
    indexINFRAS = _mspp.radioIndexFIELD + _mspp.radioIndexWORKSHOP;
    indexPEOPLE = _other.radioIndexOS +
        _other.radioIndexPO +
        _other.radioIndexLO +
        _other.radioIndexPRO +
        _other.radioIndexDO +
        _other.radioIndexAO +
        _other.radioIndexSHEO;
    indexIW = _part.radioIndexOP +
        _part.radioIndexPE +
        _part.radioIndexTS +
        _part.radioIndexCI +
        _part.radioIndexIF +
        _part.radioIndexHE;
    indexVM = _other.radioIndexPV + _other.radioIndexMTDT + _other.radioIndexEV;
    indexAE = _mspp.radioIndexAEA + _mspp.radioIndexAEB;
    indexMR = _other.radioIndexPLD + _other.radioIndexPRD + _other.radioIndexLD;
    indexOM = _mspp.radioIndexKM;
    indexOP = _part.radioIndexKP;
    indexOS = _mspp.radioIndexLTPP;
    indexRM = _other.radioIndexRM;
    indexCO = _other.radioIndexPL + _other.radioIndexPR + _other.radioIndexLG;
  }
}
