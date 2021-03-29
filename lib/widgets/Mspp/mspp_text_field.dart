import 'package:flutter/material.dart';

class MsppTextField extends StatelessWidget {
  final TextEditingController controller;

  MsppTextField({this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 100,
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == '') {
              return 'Data harus diisi';
            } else {
              return null;
            }
          },
          decoration: InputDecoration(hintText: 'Isi disini'),
        ),
      ),
    );
  }
}
