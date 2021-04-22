import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/pica_data.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

class PicaCardTableController extends GetxController {
  DatabaseProvider _databaseProvider = DatabaseProvider();
  LoginController loginController = Get.find();
  ExpandableController expandableController;
  RxList<int> indexResultA = RxList<int>.filled(6, 0);
  RxList<int> indexResultB = RxList<int>.filled(6, 0);
  RxList<int> listCounter;
  RxBool isLoading = false.obs;
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

  void checkData(int value, String id, int index) {
    int indexA = 0;
    int indexB = 0;
    if (value == 1) {
      int lengthA = picaData.value.picaElement.length;
      outer:
      for (int i = 0; i <= lengthA - 1; i++) {
        int lengthB = picaData.value.picaElement[i].picaDetail.length;
        inner:
        for (int j = 0; j <= lengthB - 1; j++) {
          if (picaData.value.picaElement[i].picaDetail[j].id == id) {
            indexA = i;
            indexB = j;
            break outer;
          }
        }
      }
      picaData.value.picaElement[indexA].picaDetail[indexB].colResult[index]
          .isNo = true;
    } else {
      picaData.value.picaElement[indexA].picaDetail[indexB].colResult[index]
          .isNo = false;
    }
  }

  counter(
      {int indexA,
      int indexB,
      int totalRow,
      int row,
      int indexCard,
      int indexData}) {
    if (listCounter == null) {
      listCounter = RxList<int>.filled(totalRow, 0);
    }
    if (indexA != null || indexB != null) {
      if (picaData.value.picaElement != null) {
        count += (indexA - lastA) + (indexB - lastB);
        lastA = indexA;
        lastB = indexB;
        picaData.value.picaElement[indexData].picaDetail[indexCard]
            .colResult[row].urgensi = indexA;
        picaData.value.picaElement[indexData].picaDetail[indexCard]
            .colResult[row].dampak = indexB;
        listCounter[row] = count;
        int temp = 0;
        for (int i = 0; i <= listCounter.length - 1; i++) {
          temp += listCounter[i];
        }
        total.value = temp;
        picaData.refresh();
        sortCard(indexData, indexCard, temp);
      }
    }
  }

  void sortCard(int indexData, int index, int value) {
    loadData();
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

  void saveData() {
    isLoading.value = true;
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
