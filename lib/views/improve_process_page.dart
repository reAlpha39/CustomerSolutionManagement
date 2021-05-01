import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/widgets/improve_process/improve_main_card.dart';
import 'package:customer/widgets/improve_process/improve_panel_card.dart';
import 'package:customer/widgets/improve_process/matrix_selector.dart';
import 'package:customer/widgets/improve_process/model_unit_selector.dart';
import 'package:customer/widgets/improve_process/type_unit_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessPage extends StatelessWidget {
  final ImproveProcessController controller = Get.find();

  showDialogTypeUnit() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Pilih Type Unit',
      content: TypeUnitSelector(),
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
    );
  }

  showDialogModelUnit() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Pilih Model Unit',
      content: ModelUnitSelector(),
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
    );
  }

  showDialogMatrixList() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Pilih Model Unit',
      content: MatrixSelector(),
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
        controller: controller.panelController,
        isDraggable: false,
        minHeight: 0,
        renderPanelSheet: false,
        backdropEnabled: true,
        maxHeight: context.height,
        panel: ImprovePanelCard(),
        collapsed: Container(),
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Improve Process'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffffcd29),
            child: Icon(
              LineIcons.plus,
            ),
            onPressed: () {
              if (controller.matrixText.value != "" &&
                  controller.modelUnitText.value != "" &&
                  controller.typeUnit.value != "") {
                controller.panelController.open();
              } else {
                Get.snackbar(
                  'Gagal',
                  'Isi kategori pada bagian atas terlebih dahulu',
                  backgroundColor: Colors.white70,
                  borderWidth: 1,
                  borderColor: Colors.black54,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(24),
                );
              }
            },
          ),
          body: Container(
            color: Color(0xffffccd29),
            height: context.height,
            width: context.width,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => showDialogMatrixList(),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          color: Colors.white,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 120,
                              maxWidth: 120,
                              maxHeight: 40,
                              minHeight: 40,
                            ),
                            child: Center(
                              child: Obx(
                                () => controller.modelUnit.value == null
                                    ? CircularProgressIndicator()
                                    : controller.matrixText.value == ""
                                        ? Text('Matrix')
                                        : Text(controller.matrixText.value),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.matrixText.value != "") {
                            showDialogModelUnit();
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          color: Colors.white,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 120,
                              maxWidth: 120,
                              maxHeight: 40,
                              minHeight: 40,
                            ),
                            child: Center(
                              child: Obx(
                                () => controller.modelUnit.value == null
                                    ? CircularProgressIndicator()
                                    : controller.modelUnitText.value == ""
                                        ? Text('Model Unit')
                                        : Text(controller.modelUnitText.value),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (controller.modelUnitText.value != "") {
                            controller.loadTypeUnit();
                            showDialogTypeUnit();
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          color: Colors.white,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 120,
                              maxWidth: 120,
                              maxHeight: 40,
                              minHeight: 40,
                            ),
                            child: Center(
                              child:
                                  Obx(() => controller.modelUnit.value == null
                                      ? CircularProgressIndicator()
                                      : controller.typeUnit.value == ""
                                          ? Text('Type Unit')
                                          : Text(controller.typeUnit.value)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ImproveMainCard(),
                          ImproveMainCard(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
