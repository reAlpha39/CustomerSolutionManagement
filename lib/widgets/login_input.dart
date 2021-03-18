import 'package:customer/controller/login_controller.dart';
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
                  child: TextFormField(
                    controller: _loginController.usernameTextController,
                    decoration: InputDecoration(
                        labelText: "Username",
                        prefixIcon: Icon(
                          Icons.email,
                          size: 20,
                        )),
                    validator: (value) {
                      if (value == '') {
                        return 'Username harus diisi';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    controller: _loginController.passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 20,
                        )),
                    validator: (value) {
                      if (value == '') {
                        return 'Password harus diisi';
                      } else {
                        return null;
                      }
                    },
                  ),
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
