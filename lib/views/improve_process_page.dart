import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/widgets/improve_process/improve_main_card.dart';
import 'package:customer/widgets/improve_process/improve_panel_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImproveProcessPage extends StatelessWidget {
  final ImproveProcessController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        slideDirection: SlideDirection.DOWN,
        controller: controller.panelController,
        isDraggable: false,
        minHeight: 0,
        renderPanelSheet: false,
        backdropEnabled: true,
        maxHeight: context.height,
        panel: ImprovePanelCard(),
        collapsed: Container(),
        body: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Improve Process'),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffffcd29),
            child: Icon(
              LineIcons.plus,
            ),
            onPressed: () => controller.panelController.open(),
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
        ),
      ),
    );
  }
}
