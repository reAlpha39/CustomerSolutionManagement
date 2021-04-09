import 'package:customer/controller/home_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerAccount extends StatelessWidget {
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: false,
                ),
                header: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Manage Customer Account',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 55, maxWidth: 55),
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
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ManageAccountButton(
                          title: 'Create',
                          desc: 'Create new customer account',
                          route: '/manage_account',
                        ),
                        ManageAccountButton(
                          title: 'Update',
                          desc: 'Update existed customer account',
                          route: '/mspp_admin',
                        ),
                        ManageAccountButton(
                          title: 'Delete',
                          desc: 'Delete unused customer account',
                          route: '/mspp_admin',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ManageAccountButton extends StatelessWidget {
  final HomeController controller = Get.find();
  final String title;
  final String desc;
  final String route;

  ManageAccountButton({Key key, this.title, this.desc, this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () => Get.toNamed(route),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)))),
        child: Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Container(
                  height: 1,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
