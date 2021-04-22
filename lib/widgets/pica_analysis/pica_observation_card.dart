import 'package:customer/controller/pica_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaObservationCard extends StatelessWidget {
  final PicaController _controller = Get.find();
  final String title;
  final int indexValue;
  final String id;

  PicaObservationCard({Key key, this.title, this.indexValue, this.id});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: InkWell(
        onTap: () => _controller.showDetailCard(indexValue, id),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          child: Container(
            width: 400,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    '$title',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffcd29),
                  ),
                  child: Center(
                      child: Text(
                    '39',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff665210),
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
