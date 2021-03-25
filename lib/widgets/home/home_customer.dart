import 'package:customer/widgets/card_icon_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: ElevatedButton(
                child: Text('Need support United Tractors'),
                onPressed: () => Get.toNamed('/customer_info'))),
      ],
    );
  }
}
