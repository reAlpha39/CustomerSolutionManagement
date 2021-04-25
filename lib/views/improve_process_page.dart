import 'package:customer/widgets/improve_process/improve_main_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImproveProcessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Improve Process'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffffcd29),
        child: Icon(
          LineIcons.plus,
        ),
        onPressed: () {},
      ),
      body: Container(
        color: Color(0xffffccd29),
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  color: Colors.white,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 120,
                      maxWidth: 120,
                      maxHeight: 40,
                      minHeight: 40,
                    ),
                    child: Center(
                      child: Text('Plant'),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  color: Colors.white,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 120,
                      maxWidth: 120,
                      maxHeight: 40,
                      minHeight: 40,
                    ),
                    child: Center(
                      child: Text('Type Unit'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ImproveMainCard(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
