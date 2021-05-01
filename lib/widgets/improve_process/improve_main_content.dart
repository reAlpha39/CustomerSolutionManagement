import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImproveMainContent extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  final int index;

  ImproveMainContent({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              child: Obx(() => Text(controller.improveProcess.value
                  .improveProcesData[index].descriptionBefore)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 300,
                    maxWidth: 300,
                    minHeight: 30,
                    maxHeight: 300,
                  ),
                  child: Container(
                    child: ClipRRect(
                      child: Image.network(
                        controller.improveProcess.value.improveProcesData[index]
                            .picturePathBefore,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : LinearProgressIndicator();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
