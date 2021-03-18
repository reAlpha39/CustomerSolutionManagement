import 'package:customer/widgets/icon_app.dart';
import 'package:customer/widgets/login_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
            color: Colors.black87,
            height: Get.height,
            child: Center(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: IconApp(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            child: Container(
                                color: Colors.white,
                                width: 350,
                                child: LoginInput())),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
