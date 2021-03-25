import 'package:customer/controller/login_controller.dart';
import 'package:customer/widgets/login/login_text_field.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginCard> {
  final LoginController _loginController = LoginController.to;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
            color: Colors.white,
            width: 350,
            child: Padding(
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxHeight: 200, maxWidth: 200),
                              child:
                                  Image.asset('assets/images/csm_logo.png')),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: LoginTextField(
                                textEditingController:
                                    _loginController.usernameTextController,
                                isObsecure: false,
                                iconData: Icons.account_circle_outlined,
                                labelText: 'Username',
                                returnError: 'Username harus diisi!')),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: LoginTextField(
                              textEditingController:
                                  _loginController.passwordTextController,
                              isObsecure: true,
                              iconData: Icons.lock_outline,
                              labelText: 'Password',
                              returnError: 'Password harus diisi!'),
                        ),
                        _loginHelper(),
                        Obx(() => _loginButton())
                      ],
                    )))));
  }

  Widget _loginHelper() {
    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: ExpandablePanel(
        theme: const ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: true,
          tapBodyToCollapse: true,
          hasIcon: false,
        ),
        header: Container(
          child: Center(
            child: Text(
              'Tidak punya akun? Klik disini',
              style: TextStyle(color: Colors.orange[800]),
            ),
          ),
        ),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text('Silahkan hubungi admin untuk mendaftarkan' +
              ' akun pada aplikasi ini.'),
        ),
      ),
    ));
  }

  Widget _loginButton() {
    bool isEnabled = true;
    if (_loginController.isLoading.value) {
      isEnabled = false;
    } else {
      isEnabled = true;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)))),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: _buttonState())),
          onPressed: isEnabled ? () => _submitData() : null),
    );
  }

  _submitData() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _loginController.userLogin();
    }
  }

  Widget _buttonState() {
    if (_loginController.isLoading.value) {
      return SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xffffcd29),
            ),
          ));
    } else {
      return Text("Login",
          style: TextStyle(fontSize: 20, color: Colors.black54));
    }
  }
}
