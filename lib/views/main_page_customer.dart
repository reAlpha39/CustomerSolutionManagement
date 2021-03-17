import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

import '../widgets/iconApp.dart';

class MainPageCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shapeground(),
      ],
    );
  }
}

class Shapeground extends StatelessWidget {
  const Shapeground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          //color: Colors.black87,
        ),
        Column(
          children: [
            ShapeOfView(
              shape: ArcShape(
                direction: ArcDirection.Outside,
                height: 34,
                position: ArcPosition.Bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                color: Colors.black87,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: IconApp(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          'Nama Customer',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17, color: Colors.white
                          ),
                        ),
                      ),
                    ])),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

loginPage(BuildContext context) {
  Navigator.pop(context);
}
