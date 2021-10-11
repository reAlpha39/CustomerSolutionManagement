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
            systemOverlayStyle: SystemUiOverlayStyle.light,
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
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: _loginController.usr.value.type == 'internal'
                            ? EdgeInsets.only(top: 80)
                            : EdgeInsets.only(top: 32),
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
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(
                                          () => _homeController
                                                      .idCustomer.value ==
                                                  ""
                                              ? Text('Pilih User')
                                              : Text(_homeController
                                                  .idCustomer.value),
                                        ),
                                        ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 35, height: 35),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffffcd29),
                                              shape: CircleBorder(),
                                            ),
                                            child: Obx(
                                              () => _homeController
                                                      .isLoading.value
                                                  ? CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.white,
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
                                  )
                                : Container(),
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

loginPage(BuildContext context) {
  Navigator.pop(context);
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
