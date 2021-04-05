import 'package:customer/controller/other_program_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherResult extends StatelessWidget {
  final OtherProgramController controller = Get.find();
  final List<String> data;
  final int index;
  final String id;

  OtherResult({this.data, this.index, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i <= data.length - 1; i++)
            Container(
              child: Row(
                children: [
                  Obx(() => Radio(
                      visualDensity: VisualDensity.compact,
                      value: i,
                      groupValue: controller.radioIndexOP(id)[index],
                      activeColor: Color(0xffffcd29),
                      onChanged: (int value) =>
                          controller.radioIndexOP(id)[index] = value)),
                  Text('${data[i]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
