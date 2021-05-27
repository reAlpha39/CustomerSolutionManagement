import 'package:customer/controller/review_meeting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewMeetingRadio extends StatelessWidget {
  final ReviewMeetingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i <= controller.reviewMeetingTypes.length - 1; i++)
            Container(
              child: Row(
                children: [
                  Obx(
                    () => Radio(
                      visualDensity: VisualDensity.compact,
                      value: i,
                      groupValue: controller.radioIndex.value,
                      activeColor: Color(0xffffcd29),
                      onChanged: (int? value) =>
                          controller.radioIndex.value = value!,
                    ),
                  ),
                  Text('${controller.reviewMeetingTypes[i]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
