import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaTextField extends StatelessWidget {
  final String tag;

  const PicaTextField({Key key, this.tag});
  @override
  Widget build(BuildContext context) {
    final PicaCardTableController globalController = Get.find(tag: "global");
    final PicaCardTableController controller = Get.find(tag: tag);
    controller.textEditingController();
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
