import 'dart:io';

import 'package:customer/widgets/login/login_card.dart';
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
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: Get.height, minWidth: Get.width),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 180),
                            child: Container(
                              child: Image.asset('assets/images/ut_logo.png'),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: Get.width,
                          color: Color(0xffffcd29),
                          child: Center(
                            child: Text(
                              'Long-Lasting Relationship',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: LoginCard()),
              ),
            ),
          ],
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
            buttonColor: Color(0xffffcd29),
            cancelTextColor: Colors.black87,
            confirmTextColor: Colors.black87,
            onConfirm: () => exit(0),
            onCancel: () => Get.back()) ??
        false;
  }
}
