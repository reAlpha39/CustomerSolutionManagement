import 'package:customer/controller/customer_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoCheckbox extends StatelessWidget {
  final CustomerInfoController controller = CustomerInfoController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Ketidakpuasan support UT',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Obx(() => CheckboxListTile(
                title: Text('Produk'),
                value: controller.checkBoxA.value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  controller.checkBoxA.value = value;
                },
              )),
          Obx(() => CheckboxListTile(
                title: Text('Service'),
                value: controller.checkBoxB.value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  controller.checkBoxB.value = value;
                },
              )),
          Obx(() => CheckboxListTile(
                title: Text('Part'),
                value: controller.checkBoxC.value,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool value) {
                  controller.checkBoxC.value = value;
                },
              )),
        ],
      ),
    );
  }
}
