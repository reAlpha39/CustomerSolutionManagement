import 'package:customer/widgets/review_meeting/review_main_card.dart';
import 'package:customer/widgets/review_meeting/tanggal_card.dart';
import 'package:flutter/material.dart';

class ReviewMeetingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Meeting"),
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
    );
  }
}
