import 'dart:io';

import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../widgets/icon_app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            brightness: Brightness.light,
          ),
          body: Container(
            child: Shapeground(),
          )),
    );
  }

  Future<bool> _onWillPop() {
    return Get.defaultDialog(
            radius: 17,
            title: 'Exit App',
            middleText: 'Apakah anda ingin keluar dari aplikasi?',
            textConfirm: 'OK',
            buttonColor: Color(0xffffcd29),
            cancelTextColor: Colors.black87,
            textCancel: 'Batal',
            confirmTextColor: Colors.black87,
            onConfirm: () => exit(0),
            onCancel: () => Get.back()) ??
        false;
  }
}

class Shapeground extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        renderPanelSheet: false,
        defaultPanelState: PanelState.OPEN,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.0),
          topLeft: Radius.circular(24.0),
        ),
        maxHeight: context.height / 1.3,
        minHeight: 150,
        panel: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.0),
                ),
              ),
              margin: const EdgeInsets.all(24.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 7),
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      width: 40,
                    ),
                    Expanded(
                      child: ScrollConfiguration(
                        behavior: CustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            child: _homeController.userView,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        collapsed: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0)),
              ),
              margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        width: 40,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: IconApp(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${_loginController.usr.value.username}',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black87),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Get.offAndToNamed('/login_page'),
                                    child: Text(
                                      'Logout',
                                      style:
                                          TextStyle(color: Color(0xffffcd29)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

loginPage(BuildContext context) {
  Navigator.pop(context);
}
