import 'package:customer/controller/manage_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioAccount extends StatelessWidget {
  final ManageAccountController controller = Get.find();
  final List<String>? data;

  RadioAccount({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i <= data!.length - 1; i++)
            Container(
              child: Row(
                children: [
                  Obx(() => Radio(
                      visualDensity: VisualDensity.compact,
                      value: i,
                      groupValue: controller.radio.value,
                      activeColor: Color(0xffffcd29),
                      onChanged: (int? value) =>
                          controller.radio.value = value!)),
                  Text('${data![i]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
