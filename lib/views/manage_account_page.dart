import 'package:customer/controller/manage_account_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/manage_account.dart/create_account.dart';
import 'package:customer/widgets/manage_account.dart/list_users_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ManageAccountPage extends StatelessWidget {
  final ManageAccountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        controller: controller.panelController,
        parallaxEnabled: true,
        parallaxOffset: 0.0,
        renderPanelSheet: false,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(17.0),
          topLeft: Radius.circular(17.0),
        ),
        maxHeight: context.height,
        panel: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 24),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: SingleChildScrollView(
                child: CreateAccount(),
              ),
            ),
          ),
        ),
        collapsed: _floatingCollapsed(),
        body: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            title: Text('Manage Customer Account'),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: Get.height, minWidth: Get.width),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: context.height * 0.3,
                        width: Get.width,
                        color: Color(0xffffcd29),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: context.height,
                child: Center(
                  child: Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Padding(
                            padding: EdgeInsets.only(bottom: 32),
                            child: ListUsersCard(),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.keyboard_arrow_up_outlined,
            color: Colors.black54,
            size: 32,
          ),
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffffcd29),
                  borderRadius: BorderRadius.all(
                    Radius.circular(17.0),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
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
