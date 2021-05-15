import 'package:customer/widgets/home/home_card.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCard(
          route: '/manage_account',
          imageAsset: 'assets/images/service_program.png',
          titleText: "Manage Customer Account",
        ),
      ],
    );
  }
}
