import 'package:customer/controller/mspp_admin_controller.dart';
import 'package:customer/controller/mspp_controller.dart';
import 'package:customer/widgets/mspp/mspp_pi.dart';
import 'package:customer/widgets/mspp/mspp_ps.dart';
import 'package:customer/widgets/mspp/mspp_ps_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppAdmin extends StatelessWidget {
  final MsppAdminController msppAdminController = Get.find();
  final MsppController msppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => Text(msppAdminController.idCustomer.value == ''
                ? 'MSPP'
                : 'MSPP ' + msppAdminController.idCustomer.value),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'PI'),
              Tab(text: 'PS Plan'),
              Tab(text: 'PS'),
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
      content: ListCustomer(),
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
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 100, maxHeight: 400, minWidth: 200, maxWidth: 200),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: msppAdminController.listCustomer.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('${msppAdminController.listCustomer[index]}'),
                  onTap: () {
                    msppAdminController.idCustomer.value =
                        msppAdminController.listCustomer[index];
                    msppController.loadData(
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
      ),
    );
  }
}
