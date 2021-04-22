import 'package:customer/models/pica_data.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

class PicaCardTableController extends GetxController {
  ExpandableController expandableController;
  RxList<int> indexResultA = RxList<int>.filled(6, 0);
  RxList<int> indexResultB = RxList<int>.filled(6, 0);
  RxList<int> listCounter;
  Rx<PicaData> picaData = PicaData().obs;
  RxInt total = 0.obs;
  RxInt totalRow = 0.obs;
  int count = 0;
  int lastA = 0;
  int lastB = 0;

  @override
  void onInit() {
    expandableController = ExpandableController();
    super.onInit();
  }

  @override
  void onClose() {
    expandableController?.dispose();
  }

  counter({int indexA, int indexB, int totalRow, int row}) {
    if (listCounter == null) {
      listCounter = RxList<int>.filled(totalRow, 0);
    }
    if (indexA != null || indexB != null) {
      count += (indexA - lastA) + (indexB - lastB);
      lastA = indexA;
      lastB = indexB;
      listCounter[row] = count;
    }
    int temp = 0;
    for (int i = 0; i <= listCounter.length - 1; i++) {
      temp += listCounter[i];
    }
    total.value = temp;
  }

  void sortCard(int indexData, int index, int value) {
    mappedCard();
    try {
      picaData.value.picaElement[indexData].picaDetail[index].result = value;
      picaData.value.picaElement[indexData].picaDetail
          .sort((a, b) => b.result.compareTo(a.result));
    } catch (e) {
      print(e);
    }
    counterMainCard(indexData);
    sortMainCard();
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

  mappedCard() {
    if (picaData.value.picaElement == null) {
      Map<String, dynamic> listPica = {
        "picaElement": [
          {
            "id": "periodic_inspection",
            "title": "Periodic Inspection",
            "score": 0,
            "picaDetail": [
              {
                "title": "Plan Unit",
                "id": "planUnit",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_inspection",
                  "docB": "plan_unit"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Meet",
                "id": "meet",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_inspection",
                  "docB": "meet"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Asses",
                "id": "asses",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_inspection",
                  "docB": "asses"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              }
            ]
          },
          {
            "id": "periodic_service_plan",
            "title": "Periodic Service Plan",
            "score": 0,
            "picaDetail": [
              {
                "title": "Compile & Compute Data",
                "id": "ccd",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_service_plan",
                  "docB": "compile_and_compute_data"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Organize & Prioritize PS Plan",
                "id": "oppsp",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_service_plan",
                  "docB": "organize_and_prioritize_ps_plan"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Balance & Scheduling PS Plan",
                "id": "bspsp",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_service_plan",
                  "docB": "balance_and_scheduling_ps_plan"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Resources & Confirm PS Plan",
                "id": "rcpsp",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_service_plan",
                  "docB": "resources_and_confirm_ps_plan"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              },
              {
                "title": "Adjust Daily for Exception",
                "id": "ade",
                "table_path": {
                  "docA": "mspp",
                  "colA": "periodic_service_plan",
                  "docB": "adjust_daily_for_exception"
                },
                "colResult": [
                  {"urgensi": 0, "dampak": 0}
                ],
                "result": 0,
                "actual": "",
                "target": "",
                "improv": ""
              }
            ]
          }
        ]
      };
      PicaData data = PicaData.fromMap(listPica);
      picaData.value = data;
      picaData.refresh();
    }
  }
}
