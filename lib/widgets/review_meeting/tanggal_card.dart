import 'package:customer/controller/review_meeting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TanggalCard extends StatelessWidget {
  final ReviewMeetingController _controller = Get.find();
  final int? index;

  TanggalCard({Key? key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Text(
                _controller.listReviewMeeting.value.reviewMeeting![index!].tanggal!),
          ),
        ),
      ),
    );
  }
}
