import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/other_program/other_co.dart';
import 'package:customer/widgets/other_program/other_mr.dart';
import 'package:customer/widgets/other_program/other_people.dart';
import 'package:customer/widgets/other_program/other_regm.dart';
import 'package:customer/widgets/other_program/other_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProgramPage extends StatelessWidget {
  final HomeController _homeController = Get.find();
  final LoginController _loginController = Get.find();
  final MsppController _msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Other Program'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('People'),
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Vendor'), Text('Management')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Management'), Text('Review')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Regular'), Text('Meeting')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Customer'), Text('Overview')],
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
                    OtherPeople(),
                    OtherVm(),
                    OtherMr(),
                    OtherRegm(),
                    OtherCo(),
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
      onCancel: () => Get.toNamed("/other_program"),
    );
  }
}
