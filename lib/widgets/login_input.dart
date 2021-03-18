import 'package:customer/controller/login_controller.dart';
import 'package:customer/widgets/login_text_field.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final LoginController _loginController = LoginController.to;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: LoginTextField(
                      textEditingController:
                          _loginController.passwordTextController,
                      isObsecure: true,
                      iconData: Icons.lock_outline,
                      labelText: 'Password',
                      returnError: 'Password harus diisi!'),
                ),
                _loginButton()
              ],
            )));
  }

  Widget _loginButton() {
    bool isEnabled = true;
    if (_loginController.state.value == 1) {
      isEnabled = false;
    } else {
      isEnabled = true;
    }
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ElevatedButton(
          style: ButtonStyle(elevation: MaterialStateProperty.all<double>(0)),
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
    if (_loginController.state.value == 0) {
      return Text("Login", style: TextStyle(fontSize: 20));
    } else if (_loginController.state.value == 1) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
        ),
      );
    } else {
      return Text("Login", style: TextStyle(fontSize: 20));
    }
  }
}

_buildPopupDialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    title: Text('Login Gagal'),
    content: Text('Username atau password salah!'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"))
    ],
  );
}
