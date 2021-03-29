import 'package:customer/controller/mspp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppResult extends StatelessWidget {
  final MsppController controller = MsppController.to;
  final List<String> data;
  final int index;
  final String id;

  MsppResult({this.data, this.index, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i <= data.length - 1; i++)
            Container(
              child: Row(
                children: [
                  Obx(() => Radio(
                      visualDensity: VisualDensity.compact,
                      value: i,
                      groupValue: controller.radioIndexPI(id)[index],
                      activeColor: Color(0xffffcd29),
                      onChanged: (int value) =>
                          controller.radioIndexPI(id)[index] = value)),
                  Text('${data[i]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
