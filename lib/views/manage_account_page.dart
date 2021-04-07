import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/manage_account.dart/create_account.dart';
import 'package:flutter/material.dart';

class ManageAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Manage Customer Account'),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xffffcd29),
            height: 200,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: CreateAccount(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
