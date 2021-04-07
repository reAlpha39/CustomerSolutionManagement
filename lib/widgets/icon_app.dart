import 'package:flutter/material.dart';

class IconApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.yellowAccent[400]),
      ),
    );
  }
}
