import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key key,
    @required TextEditingController textEditingController,
    this.labelText,
    this.returnError,
    this.isObsecure,
    this.iconData,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final String labelText;
  final String returnError;
  final bool isObsecure;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      obscureText: isObsecure,
      decoration: InputDecoration(
          fillColor: Colors.black87,
          focusColor: Colors.black87,
          hoverColor: Colors.black87,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
          labelText: labelText,
          prefixIcon: Icon(
            iconData,
            size: 20,
          )),
      validator: (value) {
        if (value == '') {
          return returnError;
        } else {
          return null;
        }
      },
    );
  }
}
