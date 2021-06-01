import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoCheckbox extends StatelessWidget {
  final CustomerInfoController controller = Get.find();
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Ketidakpuasan: ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Obx(
            () => CheckboxListTile(
              title: Text('Produk'),
              value: controller.checkBoxA.value,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xffffcd29),
              checkColor: Colors.black87,
              onChanged: (bool? value) {
                if (_loginController.usr.value.type == 'customer') {
                  controller.checkBoxA.value = value!;
                }
              },
            ),
          ),
          Obx(
            () => CheckboxListTile(
              title: Text('Service'),
              value: controller.checkBoxB.value,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xffffcd29),
              checkColor: Colors.black87,
              onChanged: (bool? value) {
                if (_loginController.usr.value.type == 'customer') {
                  controller.checkBoxB.value = value!;
                }
              },
            ),
          ),
          Obx(
            () => CheckboxListTile(
              title: Text('Part'),
              value: controller.checkBoxC.value,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Color(0xffffcd29),
              checkColor: Colors.black87,
              onChanged: (bool? value) {
                if (_loginController.usr.value.type == 'customer') {
                  controller.checkBoxC.value = value!;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
