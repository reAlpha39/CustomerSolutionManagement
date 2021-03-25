import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    onTap: () => Get.toNamed('/customer_info'),
                    trailing: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: Image.asset('assets/images/need_support.png'),
                    ),
                    title: Text("Need Support UT")))),
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    trailing: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: Image.asset('assets/images/service_program.png'),
                    ),
                    title: Text("Service Program")))),
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    trailing: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: Image.asset('assets/images/part_program.png'),
                    ),
                    title: Text("Part Program")))),
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    trailing: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: 100, maxWidth: 100),
                      child: Image.asset('assets/images/other_program.png'),
                    ),
                    title: Text("Other Program")))),
      ],
    );
  }
}
