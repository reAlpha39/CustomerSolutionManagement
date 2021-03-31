import 'package:customer/controller/customer_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoRadio extends StatelessWidget {
  final CustomerInfoController controller = Get.find();
  final List<String> data;

  CustomerInfoRadio({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Customer Segment',
              style: TextStyle(fontSize: 20),
            ),
          ),
          for (int i = 1; i <= data.length - 1; i++)
            Obx(() => ListTile(
                  title: Text('${data[i]}'),
                  leading: Radio(
                      value: i,
                      groupValue: controller.radioIndex.value,
                      activeColor: Color(0xffffcd29),
                      onChanged: (int value) =>
                          controller.radioIndex.value = value),
                )),
        ],
      ),
    );
  }
}
