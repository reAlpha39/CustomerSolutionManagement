import 'package:customer/controller/manage_account_controller.dart';
import 'package:customer/widgets/login/login_text_field.dart';
import 'package:customer/widgets/manage_account/radio_account_type.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  final ManageAccountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        margin: EdgeInsets.only(left: 30, right: 30),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, maxHeight: 550),
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.black54,
                    size: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Obx(
                      () => Text(
                        controller.titleCard.value,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoginTextField(
                              textEditingController: controller.namaTEC,
                              labelText: 'Nama Customer',
                              isObsecure: false,
                              iconData: Icons.person_add_alt_1_outlined,
                              returnError: 'Nama harus diisi',
                            ),
                          ),
                          Obx(
                            () => controller.textButton.value == 'Update'
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: LoginTextField(
                                      textEditingController:
                                          controller.usernameTEC,
                                      labelText: 'Username',
                                      isObsecure: false,
                                      iconData: Icons.account_box_outlined,
                                      returnError: 'Username harus diisi',
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoginTextField(
                              textEditingController: controller.passwordTEC,
                              labelText: 'Password',
                              isObsecure: true,
                              iconData: Icons.lock_outline_rounded,
                              returnError: 'Password harus diisi',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black38),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              padding: EdgeInsets.only(
                                  top: 10, bottom: 10, left: 10, right: 10),
                              child: ExpandableNotifier(
                                child: ScrollOnExpand(
                                  child: ExpandablePanel(
                                    theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToExpand: true,
                                        tapBodyToCollapse: true,
                                        hasIcon: true,
                                        iconPlacement:
                                            ExpandablePanelIconPlacement.right),
                                    header: Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.app_registration,
                                              color: Colors.black45,
                                            ),
                                            Flexible(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  'Tipe akun',
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    collapsed: Container(),
                                    expanded: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10, right: 10),
                                      child: RadioAccount(
                                        data: ['Admin', 'Internal', 'Customer'],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoginTextField(
                              textEditingController: controller.levelTEC,
                              labelText: 'Customer Relationship Level',
                              isObsecure: false,
                              isCrl: true,
                              iconData: Icons.person_add_alt_1_outlined,
                              returnError:
                                  'Isi 1 - 7, user selain customer isi "0".',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() => _loginButton()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    bool isEnabled = true;
    if (controller.isLoading.value) {
      isEnabled = false;
    } else {
      isEnabled = true;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: _buttonState(),
            ),
          ),
          onPressed: isEnabled ? () => controller.validateTextField() : null),
    );
  }

  Widget _buttonState() {
    if (controller.isLoading.value) {
      return SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xffffcd29),
            ),
          ));
    } else {
      return Text(controller.textButton.value,
          style: TextStyle(fontSize: 20, color: Colors.black54));
    }
  }
}
