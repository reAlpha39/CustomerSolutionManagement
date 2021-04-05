import 'package:customer/controller/other_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherTextField extends StatelessWidget {
  final OtherProgramController controller = Get.find();

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
