import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required TextEditingController? textEditingController,
    this.labelText,
    this.returnError,
    this.isObsecure,
    this.iconData,
    this.isCrl = false,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController? _textEditingController;
  final String? labelText;
  final String? returnError;
  final bool? isObsecure;
  final IconData? iconData;
  final bool? isCrl;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      obscureText: isObsecure!,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
          labelText: labelText,
          prefixIcon: Icon(
            iconData,
            size: 20,
          )),
      validator: (value) {
        if (isCrl!) {
          if (["0", "1", "2", "3", "4", "5", "6", "7"].contains(value)) {
            return null;
          } else {
            return returnError;
          }
        } else if (value == '') {
          return returnError;
        } else {
          return null;
        }
      },
    );
  }
}
