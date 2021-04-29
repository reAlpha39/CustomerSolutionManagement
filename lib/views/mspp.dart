import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:customer/widgets/mspp/mspp_ae.dart';
import 'package:customer/widgets/mspp/mspp_cbm.dart';
import 'package:customer/widgets/mspp/mspp_ovh.dart';
import 'package:customer/widgets/mspp/mspp_ovh_plan.dart';
import 'package:customer/widgets/mspp/mspp_pi.dart';
import 'package:customer/widgets/mspp/mspp_ps.dart';
import 'package:customer/widgets/mspp/mspp_ps_plan.dart';
import 'package:customer/widgets/mspp/mspp_infras.dart';
import 'package:customer/widgets/mspp/mspp_om.dart';
import 'package:customer/widgets/mspp/mspp_os.dart';
import 'package:customer/widgets/mspp/mspp_tools.dart';
import 'package:customer/widgets/mspp/mspp_ub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mspp extends StatelessWidget {
  final MsppController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MSPP'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Column(
                  children: [Text('Periodic'), Text('Inspection')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Periodic'), Text('Service Plan')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Periodic'), Text('Service')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('OVH'), Text('Plan')],
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('OVH'),
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Unschedule'), Text('Breakdown')],
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('CBM'),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Tools'),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text('Infrastructure'),
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Application'), Text('Engineer')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Ketersediaan'), Text('Mekanik')],
                ),
              ),
              Tab(
                child: Column(
                  children: [Text('Lead Time'), Text('Penyelesaian Pekerjaan')],
                ),
              ),
            ],
          ),
        ),
        body: Obx(
          () => TabBarView(
            children: [
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : MsppPi(),
              MsppPsPlan(),
              MsppPs(),
              MsppOvhPlan(),
              MsppOVH(),
              MsppUb(),
              MsppCbm(),
              MsppTools(),
              MsppInfras(),
              MsppAE(),
              MsppOm(),
              MsppOs(),
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
    PicaCardTableController picaCTController = Get.find(tag: 'global');
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
          picaCTController.saveData();
        },
        onCancel: () => Get.toNamed('/mspp'));
  }
}
