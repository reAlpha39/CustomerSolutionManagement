import 'package:customer/controller/manage_account_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/manage_account.dart/create_account.dart';
import 'package:customer/widgets/manage_account.dart/list_users_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ManageAccountPage extends StatelessWidget {
  ManageAccountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Manage Customer Account'),
      ),
      body: SlidingUpPanel(
        renderPanelSheet: false,
        panel: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: CreateAccount(),
                ),
              ),
            ),
          ),
        ),
        collapsed: _floatingCollapsed(),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(maxHeight: 200),
                color: Color(0xffffcd29),
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => controller.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListUsersCard(),
              ),
            ),
          ],
        ),
        maxHeight: 600,
        minHeight: 100,
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffcd29),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(7),
              ),
              width: 40,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Create Account",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
