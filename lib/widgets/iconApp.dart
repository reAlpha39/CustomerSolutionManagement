import 'package:flutter/material.dart';

class IconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(left: 0, top: 0),
        height: 100,
        width: 100,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
    );
  }
}
