import 'package:customer/widgets/home/home_card_expanded.dart';
import 'package:flutter/material.dart';
import 'package:customer/widgets/home/home_card.dart';

class HomeCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCard(
          route: '/customer_info',
          imageAsset: 'assets/images/need_support.png',
          titleText: "Need Support UT",
        ),
        HomeCardExpanded(),
        HomeCard(
          route: '/other_program',
          imageAsset: 'assets/images/part_program.png',
          titleText: "Part Program",
        ),
        HomeCard(
          route: '/customer_info',
          imageAsset: 'assets/images/other_program.png',
          titleText: "Other Program",
        ),
      ],
    );
  }
}
