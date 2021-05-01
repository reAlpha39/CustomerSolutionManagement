import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeUnitSelector extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  final String id;

  TypeUnitSelector({Key key, this.id});
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
              controller.typeUnits.length,
              (index) => Column(
                children: [
                  ListTile(
                    title: Text(controller.typeUnits[index]),
                    onTap: () {
                      controller.typeUnit.value = controller.typeUnits[index];
                      Get.back(closeOverlays: false);
                    },
                  ),
                  controller.typeUnits.length - 1 == index
                      ? Container()
                      : Divider(
                          thickness: 1,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
