import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/part_program/part_iw.dart';
import 'package:customer/widgets/part_program/part_kp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartProgramPage extends StatelessWidget {
  final HomeController _homeController = Get.find();
  final LoginController _loginController = Get.find();
  final MsppController _msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Part Program'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Column(
                  children: [Text('Inventory &'), Text('Warehousing')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Ketersediaan'), Text('Part')],
                ),
              ),
            ],
          ),
        ),
        body: Obx(
          () => _homeController.tempListChecklistAudit.value.checklistAudit ==
                  null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  children: [
                    PartIw(),
                    PartKp(),
                  ],
                ),
        ),
        floatingActionButton: _loginController.usr.value.type == 'customer'
            ? FloatingActionButton(
                child: Icon(
                  Icons.save_outlined,
                  color: Color(0xffffcd29),
                ),
                onPressed: showDialog,
              )
            : Container(),
      ),
    );
  }

  showDialog() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Simpan data',
      middleText: 'Apakah data yang anda masukkan sudah benar?',
      textConfirm: 'YA',
      textCancel: 'Tidak',
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
      onConfirm: () {
        _msppController.saveToDb();
      },
      onCancel: () => Navigator.of(Get.overlayContext!).pop(),
    );
  }
}
