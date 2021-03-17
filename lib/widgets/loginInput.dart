import 'package:customer/utils/auth_user.dart';
import 'package:customer/models/users.dart';
import 'package:customer/views/main_page_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_helpers/flutter_mobx_helpers.dart';

final authUser = AuthUser(); //Instantiate the store

class LoginInput extends StatefulWidget {
  @override
  _LoginInputState createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  String _username;
  String _password;
  AuthUser authUser = AuthUser();
  Users usr = Users();

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
                controller: usernameC,
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
                onSaved: (value) {
                  _username = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: passwordC,
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
                onSaved: (value) {
                  _password = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0)),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ObserverListener(
                        listener: (_) {
                          print(authUser.state);
                          if (authUser.state == 2) {
                            if (authUser.checked) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPageCustomer()));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context));
                            }
                          }
                        },
                        child: Center(
                            child: Observer(builder: (_) => _buttonChild())),
                      )),
                  onPressed: () {
                    var form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      authUser.checkUser(_username, _password);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonChild() {
    if (authUser.state == 0) {
      return Text("Login", style: TextStyle(fontSize: 20));
    } else if (authUser.state == 1) {
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
