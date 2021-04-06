import 'package:customer/controller/home_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardExpanded extends StatelessWidget {
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, minWidth: 200),
          child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              child: Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  child: ExpandableNotifier(
                    child: ScrollOnExpand(
                      child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToExpand: true,
                            tapBodyToCollapse: false,
                            hasIcon: false,
                          ),
                          header: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Service Program',
                                  style: TextStyle(fontSize: 16),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: 55, maxWidth: 55),
                                  child: Image.asset(
                                    'assets/images/service_program.png',
                                  ),
                                )
                              ],
                            ),
                          ),
                          collapsed: Container(),
                          expanded: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(17))),
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 20,
                                          left: 20),
                                      child: ElevatedButton(
                                        onPressed: () => Get.toNamed(
                                            controller.msppPage.value),
                                        style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .all<double>(0),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17)))),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 10,
                                              right: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'MSPP',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Container(
                                                  height: 1,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                    'Maintenance & Support Partnership Program',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87),
                                                    textAlign:
                                                        TextAlign.center),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 20,
                                          right: 20),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            elevation: MaterialStateProperty
                                                .all<double>(0),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17)))),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              bottom: 20,
                                              left: 10,
                                              right: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  'CMIP & COIP',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, bottom: 5),
                                                child: Container(
                                                  height: 1,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  'Maintenance & Operation Program',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )),
                    ),
                  ))),
        ));
  }
}
