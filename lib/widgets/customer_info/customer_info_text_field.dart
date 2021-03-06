import 'package:customer/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomerInfoTextField extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final TextEditingController? controller;
  final String? labelText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? isLevel;

  CustomerInfoTextField({
    this.controller,
    this.labelText,
    this.maxLines,
    this.keyboardType,
    this.isLevel = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        maxLines: maxLines,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        readOnly: _loginController.usr.value.type == "internal" ? true : false,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (isLevel!) {
            if (["1", "2", "3", "4", "5", "6", "7"].contains(value)) {
              return null;
            } else {
              return 'Isi antara 1 - 7!';
            }
          } else if (value == '') {
            return 'Data harus diisi';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
