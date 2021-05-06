import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImprovePanelContent extends StatelessWidget {
  final ImproveProcessController controller = Get.find(tag: 'global');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => TextFormField(
                    controller: controller.textEditingController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      labelText: controller.isUpdate.value
                          ? controller.isBefore.value
                              ? 'Deskripsi Before Improvement'
                              : 'Deskripsi After Improvement'
                          : 'Deskripsi Before Improvement',
                    ),
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Obx(
                      () => !controller.isPicked.value
                          ? controller.isUpdate.value
                              ? controller.isBefore.value
                                  ? PreviewImage(
                                      isBefore: true,
                                      pathPicture: controller
                                          .improveProcess
                                          .value
                                          .improveProcesData[
                                              controller.indexUpdate.value]
                                          .picturePathBefore,
                                    )
                                  : PreviewImage(
                                      isBefore: false,
                                      pathPicture: controller
                                          .improveProcess
                                          .value
                                          .improveProcesData[
                                              controller.indexUpdate.value]
                                          .picturePathAfter,
                                    )
                              : PreviewImage(
                                  isBefore: true,
                                )
                          : ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                              child: Image.file(
                                controller.image.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => controller.imageFromCamera(),
                      child: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineIcons.camera,
                              color: Color(0xff4c3d0c),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                  color: Color(0xff4c3d0c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => controller.imageFromGallery(),
                      child: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineIcons.sdCard,
                              color: Color(0xff4c3d0c),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'SD Card',
                                style: TextStyle(
                                  color: Color(0xff4c3d0c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewImage extends StatelessWidget {
  final String pathPicture;
  final bool isBefore;

  const PreviewImage({Key key, this.pathPicture, this.isBefore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: pathPicture != "" && pathPicture != null
          ? ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              child: Image.network(
                pathPicture,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isBefore
                    ? 'Photo Before Improvement'
                    : 'Photo After Improvement',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}
