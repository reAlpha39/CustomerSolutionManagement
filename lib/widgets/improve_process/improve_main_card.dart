import 'package:customer/controller/imrpove_process_controller.dart';
import 'package:customer/widgets/improve_process/improve_main_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImproveMainCard extends StatelessWidget {
  final int? index;
  final bool? isBefore;
  final ImproveProcessController controller = Get.find(tag: 'global');

  ImproveMainCard({Key? key, this.index, this.isBefore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
        minWidth: 300,
      ),
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 42, left: 10, right: 10, bottom: 20),
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
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
                          horizontal: 16,
                        ),
                        child: ImproveMainContent(
                          isBefore: isBefore,
                          index: index,
                        ),
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
              alignment:
                  isBefore! ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                constraints: BoxConstraints(
                  minWidth: 150,
                  maxWidth: 150,
                ),
                child: Card(
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
                      child: isBefore! ? Text('Before') : Text('After'),
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
