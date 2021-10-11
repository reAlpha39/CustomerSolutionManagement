import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/widgets/customer_info/customer_info_checkbox.dart';
import 'package:customer/widgets/customer_info/customer_info_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfoCardInfo extends StatelessWidget {
  final CustomerInfoController customerInfoController = Get.find();
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: Form(
              key: customerInfoController.formKeyCustomer,
              child: ExpandableNotifier(
                  initialExpanded: _loginController.usr.value.type == "internal"
                      ? true
                      : false,
                  child: ScrollOnExpand(
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToExpand:
                            _loginController.usr.value.type == "internal"
                                ? false
                                : true,
                        tapBodyToCollapse: false,
                        hasIcon: _loginController.usr.value.type == "internal"
                            ? false
                            : true,
                        tapHeaderToExpand:
                            _loginController.usr.value.type == "internal"
                                ? false
                                : true,
                      ),
                      header: Container(
                        child: Text(
                          'Customer Info',
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
                              labelText: 'Nama Perusahaan',
                              controller:
                                  customerInfoController.namaTextController,
                              maxLines: 1,
                            ),
                            CustomerInfoTextField(
                              labelText: 'Alamat Perusahaan',
                              controller:
                                  customerInfoController.alamatTextController,
                              maxLines: 1,
                            ),
                            CustomerInfoTextField(
                              labelText: 'Misi Perusahaan',
                              controller:
                                  customerInfoController.misiTextController,
                              maxLines: 3,
                            ),
                            CustomerInfoTextField(
                              labelText: 'Visi Perusahaan',
                              controller:
                                  customerInfoController.visiTextController,
                              maxLines: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: CustomerInfoRadio(
                                data: [
                                  'Rental',
                                  'Contractor Mining',
                                  'Contractor Maintenance Road',
                                  'Hauling',
                                  'Agro',
                                  'Other'
                                ],
                              ),
                            ),
                            Obx(() =>
                                customerInfoController.radioIndex.value == 5
                                    ? CustomerInfoTextField(
                                        labelText: 'Other',
                                        controller: customerInfoController
                                            .csOtherTextController,
                                        maxLines: 1,
                                      )
                                    : Container()),
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
