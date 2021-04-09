import 'package:customer/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconApp extends StatelessWidget {
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(controller.iconUser),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
