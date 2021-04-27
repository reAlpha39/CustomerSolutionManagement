import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/controller/part_program_controller.dart';
import 'package:customer/controller/pica_analysis_controller.dart';
import 'package:customer/models/column_result.dart';
import 'package:customer/models/pica_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/widgets/pica_analysis/pica_detail_card.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaCardTableController extends GetxController {
  DatabaseProvider _databaseProvider = DatabaseProvider();
  LoginController loginController = Get.find();
  ExpandableController expandableController;
  TextEditingController textEditingControllerALL;
  RxList<int> indexResultA = RxList<int>();
  RxList<int> indexResultB = RxList<int>();
  RxList<bool> boolIndex = RxList<bool>();
  RxList<int> loadIndex;
  RxBool isLoading = false.obs;
  Rx<PicaData> picaData = PicaData().obs;

  RxString id = "".obs;
  RxString title = "".obs;
  RxInt indexData = 0.obs;
  RxInt indexCard = 0.obs;
  RxString docA = "".obs;
  RxString colA = "".obs;
  RxString docB = "".obs;
  RxBool dataTableFilter = false.obs;
  RxList<int> dataTableListRadio = RxList<int>();
  int dataTableRadioIndex = 1;

  @override
  void onInit() {
    expandableController = ExpandableController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingControllerALL?.dispose();
    expandableController?.dispose();
  }

  void textEditingController() {
    textEditingControllerALL = TextEditingController();
  }

  void fillTextData(int indexData, int indexCard, int index, String id) {
    switch (id) {
      case "Actual":
        picaData.value.picaElement[indexData].picaDetail[indexCard]
            .colResult[index].actual = textEditingControllerALL.text.toString();
        break;
      case "Target":
        picaData.value.picaElement[indexData].picaDetail[indexCard]
            .colResult[index].target = textEditingControllerALL.text.toString();
        break;
      case "Priority":
        picaData.value.picaElement[indexData].picaDetail[indexCard]
            .colResult[index].improv = textEditingControllerALL.text.toString();
        break;
      default:
    }
  }

  Widget picaDetailCard(int index, PicaData picaCTCglobal) {
    MsppController msppController = Get.find();
    OtherProgramController otherController = Get.find();
    PartProgramController partController = Get.find();
    PicaAnalysisController picaAController = Get.find();
    bool isNo = false;
    String idData = picaCTCglobal
        .picaElement[picaAController.indexDetailData.value]
        .picaDetail[index]
        .id;

    if (msppController.radioIndexPI(idData) != null) {
      if (msppController.radioIndexPI(idData).contains(1)) {
        isNo = true;
      }
    } else if (otherController.radioIndexOP(idData) != null) {
      if (otherController.radioIndexOP(idData).contains(1)) {
        isNo = true;
      }
    } else if (partController.radioIndexPP(idData) != null) {
      if (partController.radioIndexPP(idData).contains(1)) {
        isNo = true;
      }
    }

    if (isNo) {
      title.value = picaCTCglobal
          .picaElement[picaAController.indexDetailData.value]
          .picaDetail[index]
          .title;
      id.value = picaCTCglobal
          .picaElement[picaAController.indexDetailData.value]
          .picaDetail[index]
          .id;
      indexData.value = picaAController.indexDetailData.value;
      indexCard.value = index;
      docA.value = picaCTCglobal
          .picaElement[picaAController.indexDetailData.value]
          .picaDetail[index]
          .tablePath
          .docA;
      colA.value = picaCTCglobal
          .picaElement[picaAController.indexDetailData.value]
          .picaDetail[index]
          .tablePath
          .colA;
      docB.value = picaCTCglobal
          .picaElement[picaAController.indexDetailData.value]
          .picaDetail[index]
          .tablePath
          .docB;
      dataTableFilter.value = true;
      dataTableRadioIndex = 1;
      if (msppController.radioIndexPI(idData) != null) {
        dataTableListRadio = msppController.radioIndexPI(idData);
      } else if (otherController.radioIndexOP(idData) != null) {
        dataTableListRadio = otherController.radioIndexOP(idData);
      } else if (partController.radioIndexPP(idData) != null) {
        dataTableListRadio = partController.radioIndexPP(idData);
      }

      return PicaDetailCard(
          tag: picaCTCglobal.picaElement[picaAController.indexDetailData.value]
              .picaDetail[index].id);
    } else {
      return Container();
    }
  }

  void checkData(int value, String id, int index) {
    int indexA = 0;
    int indexB = 0;

    int lengthA = picaData.value.picaElement.length;
    outer:
    for (int i = 0; i <= lengthA - 1; i++) {
      int lengthB = picaData.value.picaElement[i].picaDetail.length;
      for (int j = 0; j <= lengthB - 1; j++) {
        if (picaData.value.picaElement[i].picaDetail[j].id == id) {
          indexA = i;
          indexB = j;
          break outer;
        }
      }
    }
    indexData.value = indexA;
    indexCard.value = indexB;
    displayIndex(indexB, indexA);
    if (value == 1) {
      boolIndex[index] = true;
    } else {
      boolIndex[index] = false;
    }
  }

  counter({int indexA, int indexB, int row, int indexCard, int indexData}) {
    int temp = 0;
    if (picaData.value.picaElement != null) {
      List<ColResult> list =
          picaData.value.picaElement[indexData].picaDetail[indexCard].colResult;
      for (int i = 0; i <= list.length - 1; i++) {
        if (list[i].isNo) {
          temp += list[i].dampak;
          temp += list[i].urgensi;
        }
      }
      picaData.value.picaElement[indexData].picaDetail[indexCard].result = temp;
      sortCard(indexData, indexCard);
    } else {
      print("counter's PicaData null");
    }
  }

  void displayIndex(int indexCard, int indexData,
      {bool isGlobal = true, PicaData pica, String tag}) {
    loadIndex = RxList<int>();
    List<int> data = [];
    List<int> data2 = [];
    List<bool> data3 = [];
    if (isGlobal) {
      pica = picaData.value;
    }
    int length =
        pica.picaElement[indexData].picaDetail[indexCard].colResult.length;
    for (int i = 0; i <= length - 1; i++) {
      if (pica.picaElement[indexData].picaDetail[indexCard].colResult[i].isNo) {
        loadIndex.add(i);
      }
    }
    for (int j = 0;
        j <=
            pica.picaElement[indexData].picaDetail[indexCard].colResult.length -
                1;
        j++) {
      data.add(pica
          .picaElement[indexData].picaDetail[indexCard].colResult[j].urgensi);
      data2.add(pica
          .picaElement[indexData].picaDetail[indexCard].colResult[j].dampak);
      data3.add(
          pica.picaElement[indexData].picaDetail[indexCard].colResult[j].isNo);
    }
    if (indexResultA.length == 0 || indexResultB.length == 0) {
      indexResultA.addAll(data);
      indexResultB.addAll(data2);
    }
    if (boolIndex.length == 0) {
      boolIndex.addAll(data3);
    }
    print("isGlobal: " + isGlobal.toString());
    print('tag: $tag');
    print(data);
    print(data2);
    print(data3);
    print('v');
  }

  void sortCard(int indexData, int index) {
    loadData();
    try {
      picaData.value.picaElement[indexData].picaDetail
          .sort((a, b) => b.result.compareTo(a.result));
    } catch (e) {
      print(e);
    }
    counterMainCard(indexData);
    picaData.refresh();
  }

  void counterMainCard(int indexData) {
    try {
      int length = picaData.value.picaElement[indexData].picaDetail.length;
      int counter = 0;
      for (int i = 0; i <= length - 1; i++) {
        counter += picaData.value.picaElement[indexData].picaDetail[i].result;
      }
      picaData.value.picaElement[indexData].score = counter;
      sortMainCard();
    } catch (e) {
      print(e);
    }
  }

  void sortMainCard() {
    try {
      picaData.value.picaElement.sort((a, b) => b.score.compareTo(a.score));
    } catch (e) {
      print(e);
    }
  }

  void saveData() {
    isLoading.value = true;
    for (int i = 0; i <= boolIndex.length - 1; i++) {
      picaData.value.picaElement[indexData.value].picaDetail[indexCard.value]
          .colResult[i].isNo = boolIndex[i];
    }
    picaData.refresh();
    counter(indexData: indexData.value, indexCard: indexCard.value);
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .savePicaData(picaData.value, loginController.usr.value.username)
            .then((value) {
          if (value) {
            _databaseProvider.showDialog(
                title: 'Sukses', middleText: 'Data berhasil di update');
            isLoading.value = false;
          }
        });
      } else {
        isLoading.value = false;
      }
    });
  }

  void loadData() {
    loadPicaData(username: loginController.usr.value.username);
  }

  void loadPicaData({String username}) {
    if (picaData.value.picaElement == null) {
      isLoading.value = true;
      connectivityChecker().then((conn) {
        if (conn) {
          _databaseProvider.loadPicaData(username).then((value) {
            if (value != null) {
              picaData.value = value;
              picaData.refresh();
              isLoading.value = false;
            }
          });
        } else {
          isLoading.value = false;
        }
      });
    }
  }
}
