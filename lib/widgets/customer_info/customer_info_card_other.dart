import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/widgets/customer_info/customer_info_radio_single.dart';
import 'package:customer/widgets/customer_info/customer_info_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomerInfoCardOther extends StatelessWidget {
  final CustomerInfoController customerInfoController =
      CustomerInfoController.to;

  @override
  Widget build(BuildContext context) {
    customerInfoController.formKeyOther = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Form(
              key: customerInfoController.formKeyOther,
              child: ExpandableNotifier(
                  child: ScrollOnExpand(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: false,
                    hasIcon: true,
                  ),
                  header: Container(
                    child: Text(
                      'Lainnya',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomerInfoTextField(
                          labelText: 'Plan Budget UT',
                          controller:
                              customerInfoController.planBudgetTextController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                        ),
                        CustomerInfoTextField(
                          labelText: 'Problem yang sedang dihadapi',
                          controller:
                              customerInfoController.problemTextController,
                          maxLines: 3,
                        ),
                        CustomerInfoTextField(
                          labelText: 'Target yang diharapkan',
                          controller:
                              customerInfoController.targetTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoCheckbox()
                      ],
                    ),
                  ),
                ),
              ))),
        ),
      ),
    );
  }
}
