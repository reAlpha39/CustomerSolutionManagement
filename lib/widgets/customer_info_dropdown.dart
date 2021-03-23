import 'dart:math';

import 'package:customer/controller/customer_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoDropDown extends StatelessWidget {
  final CustomerInfoController controller = CustomerInfoController.to;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
      ),
      hint: Obx(() {
        return Text('${controller.dropdownValue()}');
      }),
      items: controller.listCustomerSegment.map((String e) {
        return DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (val) {
        controller.dropdown.value = val;
      },
    );
  }
}
