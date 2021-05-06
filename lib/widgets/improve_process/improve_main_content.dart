import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImproveMainContent extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  final int index;

  ImproveMainContent({Key key, this.index}) : super(key: key);
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
                      child: Text(
                        controller.improveProcess.value.improveProcesData[index]
                            .descriptionBefore,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () => controller.deleteData(index),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
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
                    InkWell(
                      onTap: () {
                        controller.openPanel(
                          isCreate: false,
                          isBefore: true,
                          index: index,
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
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
                    () => controller.improveProcess.value
                                .improveProcesData[index].picturePathBefore !=
                            ""
                        ? Image.network(
                            controller.improveProcess.value
                                .improveProcesData[index].picturePathBefore,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : LinearProgressIndicator();
                            },
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/images/no_image.jpg",
                            fit: BoxFit.cover,
                          ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
