import 'package:customer/controller/manage_account_controller.dart';
import 'package:customer/widgets/login/login_text_field.dart';
import 'package:customer/widgets/manage_account.dart/radio_account_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  final ManageAccountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      margin: EdgeInsets.only(left: 30, right: 30),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black54,
                  size: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginTextField(
                    textEditingController: controller.usernameTEC,
                    labelText: 'Username',
                    isObsecure: false,
                    iconData: Icons.account_box_outlined,
                    returnError: 'Username harus diisi',
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
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 45, bottom: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Tipe akun',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black54),
                            ),
                          ),
                        ),
                        RadioAccount(
                          data: ['Admin', 'Internal', 'Customer'],
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
      return Text("Create",
          style: TextStyle(fontSize: 20, color: Colors.black54));
    }
  }
}
