import 'package:customer/controller/review_meeting_controller.dart';
import 'package:customer/widgets/review_meeting/review_main_card.dart';
import 'package:customer/widgets/review_meeting/review_panel_card.dart';
import 'package:customer/widgets/review_meeting/tanggal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReviewMeetingPage extends StatelessWidget {
  final ReviewMeetingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        controller: controller.panelController,
        isDraggable: false,
        minHeight: 0,
        renderPanelSheet: false,
        backdropEnabled: true,
        onPanelClosed: () =>
            WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
        maxHeight: context.height,
        panel: ReviewPanelCard(),
        collapsed: Container(),
        body: Scaffold(
          appBar: AppBar(
            title: Text("Review Meeting"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.panelController!.open(),
            backgroundColor: Color(0xffffcd29),
            child: Icon(
              LineIcons.plus,
            ),
          ),
          body: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TanggalCard(),
                  ReviewMainCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
