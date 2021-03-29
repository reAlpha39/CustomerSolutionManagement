import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/Mspp/mspp_card_plan_unit.dart';
import 'package:flutter/material.dart';

class Mspp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MSPP'),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [MsppCardPlanUnit()],
          ),
        ),
      ),
    );
  }
}
