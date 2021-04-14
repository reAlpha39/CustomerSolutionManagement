import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartProgramPage extends StatelessWidget {
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
        body: TabBarView(
          children: [
            Container(),
            Container(),
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
        // controller.saveData();
      },
      onCancel: () => Get.toNamed('/part_program'),
    );
  }
}
