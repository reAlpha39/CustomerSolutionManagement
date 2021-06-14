import 'package:flutter/material.dart';
import 'package:customer/widgets/home/home_card.dart';

class HomeCustomer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCard(
          route: '/pica_page',
          imageAsset: 'assets/images/icon_pica.png',
          titleText: "Pica Analysis",
        ),
        HomeCard(
          route: '/improve_process',
          imageAsset: 'assets/images/icon_improve.png',
          titleText: "Improve Process",
        ),
        HomeCard(
          route: '/review_meeting_page',
          imageAsset: 'assets/images/icon_meeting.png',
          titleText: "Review Meeting",
        ),
      ],
    );
  }
}
