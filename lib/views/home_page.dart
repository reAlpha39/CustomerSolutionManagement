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
            systemOverlayStyle: SystemUiOverlayStyle.dark,
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
        onCancel: () => Get.back()).then((value) => value = false);
  }
}

class Shapeground extends StatelessWidget {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        isDraggable: false,
        renderPanelSheet: false,
        defaultPanelState: PanelState.OPEN,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.0),
          topLeft: Radius.circular(24.0),
        ),
        maxHeight: context.height / 1.2,
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
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: _loginController.usr.value.type == 'internal'
                            ? EdgeInsets.only(top: 190)
                            : EdgeInsets.only(top: 120),
                        child: _homeController.userView,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Material(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                            _loginController.usr.value.type == 'internal'
                                ? Column(
                                    children: [
                                      UserInfo(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 7),
                                          height: 3,
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          width: 260,
                                        ),
                                      ),
                                      UserSelector(),
                                    ],
                                  )
                                : UserInfo(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        collapsed: Container(),
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

class UserSelector extends StatelessWidget {
  UserSelector({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => _homeController.idCustomer.value == ""
                ? Text('Pilih User')
                : Text(_homeController.idCustomer.value),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: 35,
              height: 35,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xffffcd29),
                shape: CircleBorder(),
              ),
              child: Obx(
                () => _homeController.isLoading.value
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : Icon(
                        Icons.refresh_outlined,
                        size: 18,
                        color: Color(0xff4c3d0c),
                      ),
              ),
              onPressed: () => listCustomer(),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> listCustomer() {
    return Get.defaultDialog(
      barrierDismissible: false,
      radius: 17,
      title: 'Pilih customer',
      content: Center(
        child: SizedBox.fromSize(
          child: ListCustomer(),
        ),
      ),
      confirm: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
        ),
        onPressed: () => Get.back(closeOverlays: false),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text('Kembali'),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  UserInfo({Key? key}) : super(key: key);
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconApp(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '${_loginController.usr.value.username}',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Container(
              width: 80,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xffffcd29),
                ),
              ),
              child: TextButton(
                onPressed: () => Get.offAndToNamed('/login_page'),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Color(0xffffcd29),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListCustomer extends StatelessWidget {
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Obx(
        () => _homeController.listCustomer == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: List<Widget>.generate(
                    _homeController.listCustomer!.length,
                    (index) => Column(
                      children: [
                        ListTile(
                          title:
                              Text('${_homeController.listCustomer![index]}'),
                          onTap: () {
                            _homeController.idCustomer.value =
                                _homeController.listCustomer![index];
                            _homeController.loadCustomerChecklistData();
                          },
                        ),
                        index != _homeController.listCustomer!.length - 1
                            ? Divider(
                                height: 3,
                                color: Colors.black45,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
