import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImproveMainContent extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  final LoginController _loginController = Get.find();
  final int? index;
  final bool? isBefore;

  ImproveMainContent({Key? key, this.index, this.isBefore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.only(top: 12),
                  child: Obx(
                    () => SingleChildScrollView(
                      child: isBefore!
                          ? Text(
                              controller
                                  .improveProcess
                                  .value
                                  .improveProcesData![index!]
                                  .descriptionBefore!,
                              style: TextStyle(fontSize: 12),
                            )
                          : Text(
                              controller
                                          .improveProcess
                                          .value
                                          .improveProcesData![index!]
                                          .descriptionAfter !=
                                      null
                                  ? controller
                                      .improveProcess
                                      .value
                                      .improveProcesData![index!]
                                      .descriptionAfter!
                                  : "",
                              style: TextStyle(fontSize: 12),
                            ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          if (_loginController.usr.value.type == 'customer') {
                            _deleteConfirmationDialog();
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffcd29),
                          ),
                          child: Center(
                            child: Icon(
                              LineIcons.trash,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          if (_loginController.usr.value.type == 'customer') {
                            controller.openPanel(
                              isCreate: false,
                              isBeforeData: isBefore,
                              index: index,
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffffcd29),
                          ),
                          child: Center(
                            child: Icon(
                              LineIcons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Obx(
                  () => isBefore!
                      ? BoxImage(
                          pathPicture: controller.improveProcess.value
                              .improveProcesData![index!].picturePathBefore,
                        )
                      : BoxImage(
                          pathPicture: controller.improveProcess.value
                              .improveProcesData![index!].picturePathAfter,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _deleteConfirmationDialog() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Hapus Data',
      middleText: 'Apakah anda yakin ingin menghapus data ini?',
      textConfirm: 'YA',
      textCancel: 'Tidak',
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
      onConfirm: () {
        controller.deleteData(index!);
      },
      onCancel: () => Get.toNamed("/improve_process"),
    );
  }
}

class BoxImage extends StatelessWidget {
  final String? pathPicture;

  const BoxImage({Key? key, this.pathPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: pathPicture != "" && pathPicture != null
            ? Image.network(
                pathPicture!,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              )
            : Image.asset(
                "assets/images/no_image.jpg",
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
