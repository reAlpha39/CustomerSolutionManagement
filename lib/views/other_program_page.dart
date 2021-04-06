import 'package:customer/controller/other_program_controller.dart';
import 'package:customer/widgets/other_program/other_people.dart';
import 'package:customer/widgets/other_program/other_regm.dart';
import 'package:customer/widgets/other_program/other_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherProgramPage extends StatelessWidget {
  final OtherProgramController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  children: [Text('Regular'), Text('Meeting')],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OtherPeople(),
            OtherVm(),
            OtherRegm(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.save_outlined,
            color: Color(0xffffcd29),
          ),
          onPressed: showDialog,
        ),
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
        controller.saveData();
      },
      onCancel: () => Get.toNamed('/other_program'),
    );
  }
}
