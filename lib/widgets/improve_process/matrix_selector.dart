import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatrixSelector extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 100, maxHeight: 500, minWidth: 300, maxWidth: 300),
      padding: const EdgeInsets.all(8.0),
      child: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: List<Widget>.generate(
              controller.matrixList.length,
              (index) => ListTile(
                title: Text(controller.matrixList[index]),
                onTap: () {
                  controller.matrixText.value = controller.matrixList[index];
                  controller.modelUnitText.value = "";
                  controller.typeUnit.value = "";
                  Get.back(closeOverlays: false);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
