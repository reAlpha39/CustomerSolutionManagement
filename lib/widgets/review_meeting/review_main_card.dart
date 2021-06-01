import 'package:customer/controller/login_controller.dart';
import 'package:customer/controller/review_meeting_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/box_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ReviewMainCard extends StatelessWidget {
  final ReviewMeetingController _controller = Get.find();
  final int? index;

  ReviewMainCard({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 600,
      height: 220,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 7,
                child: Container(
                  height: 220,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.listReviewMeeting.value
                            .reviewMeeting![index!].nama!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              _controller.listReviewMeeting.value
                                  .reviewMeeting![index!].type!,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          child: Scrollbar(
                            thickness: 1,
                            child: ScrollConfiguration(
                              behavior: CustomScrollBehavior(),
                              child: SingleChildScrollView(
                                child: Text(_controller.listReviewMeeting.value
                                    .reviewMeeting![index!].agenda!),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            height: 1,
                            width: context.isLandscape ? 280 : 180,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Note:",
                            style: TextStyle(fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 30,
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Text(
                                    _controller.listReviewMeeting.value
                                        .reviewMeeting![index!].note!,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              context.isLandscape
                  ? ImageColumnLandscape(
                      index: index,
                      dialog: _deleteConfirmationDialog,
                    )
                  : ImageColumnPotrait(
                      index: index,
                      dialog: _deleteConfirmationDialog,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  _deleteConfirmationDialog() {
    return Get.defaultDialog(
      radius: 17,
      title: 'Hapus Data',
      middleText: 'Apakah anda yakin ingin menghapus data ini?',
      textConfirm: 'YA',
      textCancel: 'Tidak',
      confirmTextColor: Colors.black87,
      buttonColor: Color(0xffffcd29),
      cancelTextColor: Colors.black87,
      onConfirm: () {
        _controller.deleteReviewMeeting(index!);
      },
      onCancel: () => Get.toNamed("/review_meeting_page"),
    );
  }
}

class ImageColumnPotrait extends StatelessWidget {
  final ReviewMeetingController _controller = Get.find();
  final LoginController _loginController = Get.find();
  final int? index;
  final Function? dialog;

  ImageColumnPotrait({Key? key, this.index, this.dialog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Obx(
              () => ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 141),
                child: BoxImage(
                  pathPicture: _controller
                      .listReviewMeeting.value.reviewMeeting![index!].picture,
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_loginController.usr.value.type == 'customer') {
                      dialog!();
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _loginController.usr.value.type == 'customer'
                          ? Color(0xffffcd29)
                          : Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.trash,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_loginController.usr.value.type == 'customer') {
                      _controller.openReviewPanel(
                        isCreate: false,
                        index: index,
                      );
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _loginController.usr.value.type == 'customer'
                          ? Color(0xffffcd29)
                          : Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.edit,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageColumnLandscape extends StatelessWidget {
  final ReviewMeetingController _controller = Get.find();
  final LoginController _loginController = Get.find();
  final int? index;
  final Function? dialog;

  ImageColumnLandscape({Key? key, this.index, this.dialog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Obx(
              () => ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 220),
                child: BoxImage(
                  pathPicture: _controller
                      .listReviewMeeting.value.reviewMeeting![index!].picture,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_loginController.usr.value.type == 'customer') {
                      dialog!();
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _loginController.usr.value.type == 'customer'
                          ? Color(0xffffcd29)
                          : Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.trash,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {
                    if (_loginController.usr.value.type == 'customer') {
                      _controller.openReviewPanel(
                        isCreate: false,
                        index: index,
                      );
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _loginController.usr.value.type == 'customer'
                          ? Color(0xffffcd29)
                          : Colors.grey.shade300,
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.edit,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
