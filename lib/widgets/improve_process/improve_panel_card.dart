import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/widgets/improve_process/improve_panel_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImprovePanelCard extends StatelessWidget {
  final ImproveProcessController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffffcd29),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 72.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () => controller.panelController.close(),
                  child: Icon(
                    LineIcons.times,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  width: 220,
                  child: Text(
                    "Panel",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(17),
                ),
              ),
              child: ImprovePanelContent(),
            ),
          ),
        ],
      ),
    );
  }
}
