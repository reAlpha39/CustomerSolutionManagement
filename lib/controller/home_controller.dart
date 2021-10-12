import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/checklist_audit/list_checklist_audit.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:customer/widgets/home/home_admin.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/home/home_internal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final DatabaseProvider _databaseProvider = DatabaseProvider();
  final LoginController _loginController = Get.find();

  RxString msppPage = ''.obs;
  Widget? userView;
  String iconUser = '';

  late RxList<String>? listCustomer;
  RxString idCustomer = ''.obs;
  RxBool isLoading = false.obs;
  Rx<ListChecklistAudit> tempListChecklistAudit = ListChecklistAudit().obs;

  @override
  void onInit() {
    _userType();
    _loadListCustomer();
    loadCustomerChecklistData();
    super.onInit();
  }

  void loadCustomerChecklistData() {
    if (_loginController.usr.value.type == 'customer') {
      loadMsppChecklistAudit(username: _loginController.usr.value.username);
    } else if (idCustomer.value != '') {
      showProgressDialog();
      loadMsppChecklistAudit(username: idCustomer.value);
    }
  }

  void loadMsppChecklistAudit({String? username, String? part}) {
    connectivityChecker().then((conn) {
      if (conn) {
        _databaseProvider
            .loadCheckListData(username: username, part: part)
            .then((value) {
          tempListChecklistAudit.value = value;
          tempListChecklistAudit.refresh();
          if (Get.isDialogOpen!) {
            Navigator.of(Get.overlayContext!).pop();
          }
        });
      }
    });
  }

  void _userType() {
    String? type = _loginController.usr.value.type;
    switch (type) {
      case 'admin':
        //command here
        userView = HomeAdmin();
        msppPage.value = '/mspp_admin';
        iconUser = 'assets/images/icon_admin.png';
        break;
      case 'internal':
        //command here
        userView = HomeInternal();
        msppPage.value = '/mspp';
        iconUser = 'assets/images/icon_tc.png';
        break;
      case 'customer':
        //command here
        userView = HomeCustomer();
        msppPage.value = '/mspp';
        iconUser = 'assets/images/icon_customer.png';
        break;
      default:
        //command unknown
        userView = Container();
    }
  }

  _loadListCustomer() {
    try {
      if (_loginController.usr.value.type == 'internal') {
        isLoading.value = true;
        print(isLoading.value);
        _databaseProvider.listCustomer().then((value) {
          listCustomer = [''].obs;
          listCustomer!.addAll(value);
          listCustomer!.removeAt(0);
          isLoading.value = false;
          print(isLoading.value);
        });
      }
    } catch (exception) {}
  }
}
