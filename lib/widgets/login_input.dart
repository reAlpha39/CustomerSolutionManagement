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
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 50),
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
                        labelText: 'Username',
                        returnError: 'Username harus diisi!')),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: LoginTextField(
                      textEditingController:
                          _loginController.passwordTextController,
                      isObsecure: true,
                      labelText: 'Password',
                      returnError: 'Password harus diisi!'),
                ),
                _loginButton()
              ],
            )));
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: ElevatedButton(
          style: ButtonStyle(elevation: MaterialStateProperty.all<double>(0)),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: _buttonState())),
          onPressed: () {
            var form = _formKey.currentState;
            if (form.validate()) {
              form.save();
              _loginController.userLogin();
            }
          }),
    );
  }

  Widget _buttonState() {
    if (_loginController.state.value == 0) {
      return Text("Login", style: TextStyle(fontSize: 20));
    } else if (_loginController.state.value == 1) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
