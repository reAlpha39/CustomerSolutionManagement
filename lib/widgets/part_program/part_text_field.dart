import 'package:customer/controller/part_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartTextField extends StatelessWidget {
  final PartProgramController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: TextField(
          controller: controller.textEditingControllerALL,
          decoration: InputDecoration(hintText: 'Isi disini'),
        ),
      ),
    );
  }
}
