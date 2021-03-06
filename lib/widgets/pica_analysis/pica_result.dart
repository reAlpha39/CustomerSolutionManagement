import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/pica_card_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaResult extends StatelessWidget {
  final List<String>? data;
  final int? index;
  final String? id;
  final String? tag;
  final bool? isA;

  PicaResult({this.data, this.index, this.id, this.isA, this.tag});

  @override
  Widget build(BuildContext context) {
    final PicaCardTableController _controller = Get.find(tag: tag);
    final HomeController _homeController = Get.find();
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i <= data!.length - 1; i++)
              Container(
                child: Row(
                  children: [
                    Obx(
                      () => Radio(
                        visualDensity: VisualDensity.compact,
                        value: i,
                        groupValue: isA!
                            ? _controller
                                .indexResultA[_controller.loadIndex[index!]]
                            : _controller
                                .indexResultB[_controller.loadIndex[index!]],
                        activeColor: Color(0xffffcd29),
                        onChanged: (int? value) {
                          if (isA!) {
                            _homeController
                                .tempListChecklistAudit
                                .value
                                .checklistAudit![_controller.indexData.value]
                                .checklistElement![_controller.indexCard.value]
                                .checklistData![_controller.loadIndex[index!]]
                                .urgensi = value;
                            _controller.indexResultA[
                                _controller.loadIndex[index!]] = value;
                          } else {
                            _homeController
                                .tempListChecklistAudit
                                .value
                                .checklistAudit![_controller.indexData.value]
                                .checklistElement![_controller.indexCard.value]
                                .checklistData![_controller.loadIndex[index!]]
                                .dampak = value;
                            _controller.indexResultB[
                                _controller.loadIndex[index!]] = value;
                          }
                        },
                      ),
                    ),
                    Text('${data![i]}'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
