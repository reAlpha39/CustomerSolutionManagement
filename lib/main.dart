import 'package:customer/views/login_page.dart';
import 'package:customer/views/main_page_customer.dart';
import 'package:flutter/material.dart';

import 'views/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: LoginPage(),
        ));
  }
}
