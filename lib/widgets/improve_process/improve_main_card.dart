import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/widgets/improve_process/improve_main_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ImproveMainCard extends StatelessWidget {
  final int index;
  final ImproveProcessController controller = Get.find(tag: 'global');

  ImproveMainCard({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 42, left: 18, right: 18, bottom: 20),
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 550,
                      maxWidth: 600,
                      maxHeight: 200,
                      minHeight: 150,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: ImproveMainContent(
                        index: index,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 500,
                  maxWidth: 600,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Color(0xffffcd29),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 120,
                          maxWidth: 120,
                          maxHeight: 40,
                          minHeight: 40,
                        ),
                        child: Center(
                          child: Text('Before'),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      color: Colors.grey.shade300,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 120,
                            maxWidth: 120,
                            maxHeight: 40,
                            minHeight: 40),
                        child: Center(
                          child: Text('After'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 5,
            child: InkWell(
              onTap: () => controller.panelController.open(),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffffcd29),
                  ),
                  child: Center(
                    child: Icon(
                      LineIcons.edit,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
