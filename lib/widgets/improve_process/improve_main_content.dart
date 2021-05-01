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
      padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 12, top: 12, bottom: 12),
                child: Obx(() => Text(controller.improveProcess.value
                    .improveProcesData[index].descriptionBefore)),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
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
                    onTap: () => controller.panelController.open(),
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
          AspectRatio(
            aspectRatio: 3 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                controller.improveProcess.value.improveProcesData[index]
                    .picturePathBefore,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
