import 'package:customer/controller/login_controller.dart';
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
  final LoginController _loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        controller: controller.panelController,
        isDraggable: false,
        minHeight: 0,
        renderPanelSheet: false,
        backdropEnabled: true,
        onPanelClosed: () => controller.onClosePanel(),
        maxHeight: context.height,
        panel: ReviewPanelCard(),
        collapsed: Container(),
        body: Scaffold(
          appBar: AppBar(
            title: Text("Review Meeting"),
          ),
          floatingActionButton: _loginController.usr.value.type == 'customer'
              ? FloatingActionButton(
                  onPressed: () => controller.openReviewPanel(),
                  backgroundColor: Color(0xffffcd29),
                  child: Icon(
                    LineIcons.plus,
                  ),
                )
              : Container(),
          body: Center(
            child: Obx(
              () => controller.listReviewMeeting.value.reviewMeeting == null
                  ? Container()
                  : controller.listReviewMeeting.value.reviewMeeting!.length !=
                          0
                      ? Container(
                          height: context.height,
                          width: context.width,
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: List<Widget>.generate(
                                    controller.listReviewMeeting.value
                                        .reviewMeeting!.length,
                                    (index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TanggalCard(
                                          index: index,
                                        ),
                                        ReviewMainCard(
                                          index: index,
                                        ),
                                      ],
                                    ),
                                  ).reversed.toList(),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          child: Center(
                            child: Text(
                              'Belum ada data',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
