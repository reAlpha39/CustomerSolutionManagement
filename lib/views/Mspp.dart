import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/Mspp/mspp_pi.dart';
import 'package:customer/widgets/Mspp/mspp_ps.dart';
import 'package:customer/widgets/Mspp/mspp_ps_plan.dart';
import 'package:customer/widgets/mspp/mspp_infras.dart';
import 'package:customer/widgets/mspp/mspp_om.dart';
import 'package:customer/widgets/mspp/mspp_os.dart';
import 'package:customer/widgets/mspp/mspp_tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mspp extends StatelessWidget {
  final MsppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MSPP'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'PI'),
              Tab(text: 'PS Plan'),
              Tab(text: 'PS'),
              Tab(text: 'TOOLS'),
              Tab(text: 'INFRAS'),
              Tab(text: 'OM'),
              Tab(text: 'OS'),
            ],
          ),
        ),
        body: Obx(
          () => TabBarView(
            children: [
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppPi(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppPsPlan(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppPs(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppTools(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppInfras(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppOm(),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppOs(),
            ],
          ),
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
          controller.saveDataMspp();
        },
        onCancel: () => Get.toNamed('/mspp'));
  }
}
