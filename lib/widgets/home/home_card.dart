import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final String route;
  final String imageAsset;
  final String titleText;

  const HomeCard({Key key, this.route, this.imageAsset, this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            child: ListTile(
                title: Text(titleText),
                contentPadding: EdgeInsets.all(20),
                onTap: () => Get.toNamed(route),
                trailing: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                  child: Image.asset(
                    imageAsset,
                  ),
                ))));
  }
}
