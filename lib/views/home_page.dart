import 'dart:io';

import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:shape_of_view/shape_of_view.dart';
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
            backgroundColor: Colors.black87,
            brightness: Brightness.dark,
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
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 435),
                child: IconApp(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 425),
                child: Text(
                  '${_loginController.usr.value.username}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 55, bottom: 380),
                child: TextButton(
                  onPressed: () {
                    Get.offAndToNamed('/login_page');
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Color(0xffffcd29)),
                  ),
                ),
              ),
            ],
          ),
          SlidingUpPanel(
            defaultPanelState: PanelState.OPEN,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            maxHeight: MediaQuery.of(context).size.height * 0.67,
            minHeight: MediaQuery.of(context).size.height * 0.35,
            panel: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SingleChildScrollView(
                child: Container(
                  child: _homeController.userView,
                ),
              ),
            ),
            collapsed: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Center(
                child: Text(
                  "This is the collapsed Widget",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

loginPage(BuildContext context) {
  Navigator.pop(context);
}
