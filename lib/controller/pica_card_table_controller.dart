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
      picaData.value.listPica[indexData][3][index][3] = value;
      List temp = picaData.value.listPica[indexData][3];
      temp.sort((a, b) {
        return b[3].compareTo(a[3]);
      });
    } catch (e) {
      print(e);
    }
    counterMainCard(indexData);
    sortMainCard();
    picaData.refresh();
  }

  void counterMainCard(int indexData) {
    try {
      int length = picaData.value.listPica[indexData][3].length;
      int counter = 0;
      for (int i = 0; i <= length - 1; i++) {
        counter += picaData.value.listPica[indexData][3][i][3];
      }
      picaData.value.listPica[indexData][2] = counter;
    } catch (e) {
      print(e);
    }
  }

  void sortMainCard() {
    try {
      picaData.value.listPica.sort((a, b) => b[2].compareTo(a[2]));
    } catch (e) {
      print(e);
    }
  }

  mappedCard() {
    if (picaData.value.listPica == null) {
      Map<String, dynamic> listPica = {
        "listPica": [
          [
            "periodic_inspection",
            "Periodic Inspection",
            0,
            [
              [
                'Plan Unit',
                'planUnit',
                ['mspp', 'periodic_inspection', 'plan_unit'],
                0,
                ""
              ],
              [
                'Meet',
                'meet',
                ['mspp', 'periodic_inspection', 'meet'],
                0,
                ""
              ],
              [
                'Asses',
                'asses',
                ['mspp', 'periodic_inspection', 'asses'],
                0,
                ""
              ],
            ]
          ],
          [
            "periodic_service_plan",
            "Periodic Service Plan",
            0,
            [
              [
                'Compile & Compute Data',
                'ccd',
                ['mspp', 'periodic_service_plan', 'compile_and_compute_data'],
                0,
                ""
              ],
              [
                'Organize & Prioritize PS Plan',
                'oppsp',
                [
                  'mspp',
                  'periodic_service_plan',
                  'organize_and_prioritize_ps_plan'
                ],
                0,
                ""
              ],
              [
                'Balance & Scheduling PS Plan',
                'bspsp',
                [
                  'mspp',
                  'periodic_service_plan',
                  'balance_and_scheduling_ps_plan'
                ],
                0,
                ""
              ],
              [
                'Resources & Confirm PS Plan',
                'rcpsp',
                [
                  'mspp',
                  'periodic_service_plan',
                  'resources_and_confirm_ps_plan'
                ],
                0,
                ""
              ],
              [
                'Adjust Daily for Exception',
                'ade',
                ['mspp', 'periodic_service_plan', 'adjust_daily_for_exception'],
                0,
                ""
              ],
            ]
          ]
        ]
      };
      PicaData data = PicaData.fromMap(listPica);
      picaData.value = data;
      picaData.refresh();
    }
  }
}
