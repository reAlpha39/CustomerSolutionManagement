import 'package:flutter/material.dart';

class CardIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            child: Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 50.0,
                      color: Colors.brown,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ))));
  }
}
