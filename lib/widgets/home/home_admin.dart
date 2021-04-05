import 'package:customer/widgets/home/customer_account.dart';
import 'package:customer/widgets/home/home_card_expanded.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCardExpanded(),
        CustomerAccount(),
      ],
    );
  }
}
