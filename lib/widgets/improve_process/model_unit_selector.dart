import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelUnitSelector extends StatelessWidget {
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
              controller.modelUnit.value.modelId.length,
              (index) => ListTile(
                title: Text(controller.modelUnit.value.modelId[index]),
                onTap: () {
                  controller.modelUnitText.value =
                      controller.modelUnit.value.modelId[index];
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
