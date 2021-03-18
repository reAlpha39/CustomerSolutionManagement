import 'dart:io';

import 'package:customer/widgets/icon_app.dart';
import 'package:customer/widgets/login_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
                            child: LoginCard()),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return Get.defaultDialog(
            radius: 17,
            title: 'Exit App',
            middleText: 'Apakah anda ingin keluar dari aplikasi?',
            textConfirm: 'OK',
            textCancel: 'Batal',
            confirmTextColor: Colors.white,
            onConfirm: () => exit(0),
            onCancel: () => Get.back()) ??
        false;
  }
}
