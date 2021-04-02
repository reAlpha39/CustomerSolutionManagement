import 'package:customer/controller/mspp_admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppAdmin extends StatelessWidget {
  final MsppAdminController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MSPP'),
      ),
      body: Container(
        child: Center(
          child: Obx(
            () => Text('User: ' + controller.idCustomer.value),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          child: controller.isLoading.value
              ? CircularProgressIndicator()
              : Icon(Icons.person_outline_sharp),
          onPressed: listCustomer,
        ),
      ),
    );
  }

  Future<bool> listCustomer() {
    return Get.defaultDialog(
        barrierDismissible: false,
        radius: 17,
        title: 'Pilih salah satu',
        content: ListCustomer(),
        textConfirm: 'OK',
        buttonColor: Color(0xffffcd29),
        confirmTextColor: Colors.black87,
        onConfirm: () => Get.back(closeOverlays: false));
  }
}

class ListCustomer extends StatelessWidget {
  final MsppAdminController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        child: ListView.builder(
          itemCount: controller.listCustomer.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${controller.listCustomer[index]}'),
              onTap: () =>
                  controller.idCustomer.value = controller.listCustomer[index],
            );
          },
        ),
      ),
    );
  }
}
