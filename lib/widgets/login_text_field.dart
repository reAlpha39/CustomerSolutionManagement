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
    return Theme(
      data: ThemeData(primarySwatch: Colors.amber),
      child: TextFormField(
        controller: _textEditingController,
        obscureText: isObsecure,
        decoration: InputDecoration(
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
      ),
    );
  }
}
