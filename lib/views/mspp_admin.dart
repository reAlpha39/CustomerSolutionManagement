import 'package:customer/controller/mspp_admin_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/mspp/mspp_infras.dart';
import 'package:customer/widgets/mspp/mspp_om.dart';
import 'package:customer/widgets/mspp/mspp_os.dart';
import 'package:customer/widgets/mspp/mspp_pi.dart';
import 'package:customer/widgets/mspp/mspp_ps.dart';
import 'package:customer/widgets/mspp/mspp_ps_plan.dart';
import 'package:customer/widgets/mspp/mspp_tools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppAdmin extends StatelessWidget {
  final MsppAdminController msppAdminController = Get.find();
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(msppAdminController.idCustomer.value == ''
                ? 'MSPP'
                : 'MSPP ' + msppAdminController.idCustomer.value),
          ),
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
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppPi(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppPsPlan(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppPs(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppTools(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppInfras(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppOm(),
              msppAdminController.idCustomer.value == ''
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Untuk pilih customer tekan tombol pada kanan bawah layar.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  : MsppOs(),
            ],
          ),
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton(
            child: msppAdminController.isLoading.value
                ? CircularProgressIndicator()
                : Icon(Icons.person_outline_sharp),
            onPressed: listCustomer,
          ),
        ),
      ),
    );
  }

  Future<bool> listCustomer() {
    return Get.defaultDialog(
      barrierDismissible: false,
      radius: 17,
      title: 'Pilih customer',
      content: Align(
        alignment: Alignment.center,
        child: Container(
          height: Get.context.isLandscape ? Get.height / 3 : Get.height / 2,
          constraints:
              BoxConstraints(minHeight: 100, minWidth: 250, maxWidth: 250),
          child: ListCustomer(),
        ),
      ),
      confirm: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
        ),
        onPressed: () => Get.back(closeOverlays: false),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text('Kembali'),
        ),
      ),
    );
  }
}

class ListCustomer extends StatelessWidget {
  final MsppAdminController msppAdminController = Get.find();
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: msppAdminController.listCustomer.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text('${msppAdminController.listCustomer[index]}'),
                onTap: () {
                  msppAdminController.idCustomer.value =
                      msppAdminController.listCustomer[index];
                  msppController.loadMsppChecklistAudit(
                      username: msppAdminController.idCustomer.value);
                  Get.back(closeOverlays: false);
                },
              ),
              index != msppAdminController.listCustomer.length - 1
                  ? Divider(
                      height: 3,
                      color: Colors.black45,
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
