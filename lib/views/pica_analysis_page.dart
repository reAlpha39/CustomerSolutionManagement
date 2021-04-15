import 'package:customer/widgets/pica_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PicaAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pica Analysis'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: Get.height, minWidth: Get.width),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: context.height * 0.3,
                    width: Get.width,
                    color: Color(0xffffcd29),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: PicaChart(),
            ),
          ),
        ],
      ),
    );
  }
}
