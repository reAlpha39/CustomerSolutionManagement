import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessController extends GetxController {
  PanelController panelController;
  TextEditingController textEditingController;
  RxString description;
  final _picker = ImagePicker();
  RxBool isPicked = false.obs;
  Rx<File> image;

  @override
  void onInit() {
    panelController = PanelController();
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController?.dispose();
    resetPanel();
  }

  void saveData() {}

  void resetPanel() {
    textEditingController.clear();
    isPicked.value = false;
    if (image != null) {
      image.value.delete();
    }
  }

  Future imageFromCamera() async {
    isPicked.value = false;
    var file = await _picker.getImage(source: ImageSource.camera);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }

  Future imageFromGallery() async {
    isPicked.value = false;
    var file =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }
}
