import 'package:customer/controller/mspp_controller.dart';
import 'package:flutter/material.dart';

class MsppTextField extends StatelessWidget {
  final MsppController controller = MsppController.to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        child: TextField(
          controller: controller.textEditingControllerALL,
          decoration: InputDecoration(hintText: 'Isi disini'),
        ),
      ),
    );
  }
}
