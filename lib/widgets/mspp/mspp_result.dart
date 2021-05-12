import 'package:customer/controller/mspp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppResult extends StatelessWidget {
  final MsppController controller = Get.find();
  final List<String>? data;
  final int? index;
  final String? colA;
  final String? id;
  final int? res;

  MsppResult({this.data, this.index, this.id, this.colA, this.res});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i <= data!.length - 1; i++)
            Container(
              child: Row(
                children: [
                  Obx(() => Radio(
                      visualDensity: VisualDensity.compact,
                      value: i,
                      groupValue: controller.assessmentResult.value,
                      activeColor: Color(0xffffcd29),
                      onChanged: (int? value) {
                        controller.assessmentResult.value = value!;
                      })),
                  Text('${data![i]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
