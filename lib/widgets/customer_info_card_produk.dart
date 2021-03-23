import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/widgets/customer_info_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomerInfoCardProduk extends StatelessWidget {
  final CustomerInfoController customerInfoController =
      CustomerInfoController.to;
  @override
  Widget build(BuildContext context) {
    customerInfoController.formKeyProduk = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Form(
              key: customerInfoController.formKeyProduk,
              child: ExpandableNotifier(
                  child: ScrollOnExpand(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: true,
                  ),
                  header: Container(
                    child: Text(
                      'Total Produk',
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
                          labelText: 'United Tractors',
                          controller: customerInfoController
                              .tpUnitedTractorTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoTextField(
                          labelText: 'TrakindoCAT',
                          controller:
                              customerInfoController.tpTrakindoTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoTextField(
                          labelText: 'KobelDO',
                          controller:
                              customerInfoController.tdKobelDoTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoTextField(
                          labelText: 'Hitachi',
                          controller:
                              customerInfoController.tpHitachiTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoTextField(
                          labelText: 'Suny',
                          controller:
                              customerInfoController.tpSunyTextController,
                          maxLines: 1,
                        ),
                        CustomerInfoTextField(
                          labelText: 'Lainnya',
                          controller:
                              customerInfoController.tpOtherTextController,
                          maxLines: 1,
                        ),
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
