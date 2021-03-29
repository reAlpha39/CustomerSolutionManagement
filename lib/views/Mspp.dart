import 'package:customer/widgets/Mspp/mspp_pi.dart';
import 'package:customer/widgets/Mspp/mspp_ps_plan.dart';
import 'package:flutter/material.dart';

class Mspp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MSPP'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'PI'),
              Tab(text: 'PS Plan'),
              Tab(text: 'PS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MsppPi(),
            MsppPsPlan(),
            Container(),
          ],
        ),
      ),
    );
  }
}
