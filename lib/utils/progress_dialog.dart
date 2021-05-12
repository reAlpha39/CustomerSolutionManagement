import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showProgressDialog() {
  if (Get.isDialogOpen!) {
    Navigator.of(Get.overlayContext!).pop();
  }
  WidgetsBinding.instance!.addPostFrameCallback(
    (_) async {
      Get.dialog(
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 50,
                minHeight: 50,
                maxWidth: 50,
                minWidth: 50,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Container(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          barrierDismissible: false);
    },
  );
}
