import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key key,
    @required TextEditingController textEditingController,
    this.labelText,
    this.returnError, this.isObsecure,
  })  : _textEditingController = textEditingController,
        super(key: key);

  final TextEditingController _textEditingController;
  final String labelText;
  final String returnError;
  final bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      obscureText: isObsecure,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            Icons.lock,
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
