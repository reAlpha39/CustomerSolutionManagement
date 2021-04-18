import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

class PicaCardTableController extends GetxController {
  ExpandableController expandableController;
  RxList<int> indexResultA = RxList<int>.filled(6, 0);
  RxList<int> indexResultB = RxList<int>.filled(6, 0);
  RxList<int> listCounter;
  RxList listCard;
  RxMap<String, List> mapCard = RxMap<String, List>();
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

  sortCard(int index, int value) {
    if (listCard == null) {
      listedCard();
    }
    listCard[index][3] = value;
    listCard.sort((a, b) => b[3].compareTo(a[3]));
  }

  listedCard() {
    if (listCard == null) {
      listCard = [
        [
          'Plan Unit',
          'planUnit',
          ['mspp', 'periodic_inspection', 'plan_unit'],
          0,
        ],
        [
          'Meet',
          'meet',
          ['mspp', 'periodic_inspection', 'meet'],
          0,
        ],
        [
          'Asses',
          'asses',
          ['mspp', 'periodic_inspection', 'asses'],
          0,
        ],
      ].obs;
    }
  }
}
