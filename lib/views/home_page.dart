import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/home/home_customer.dart';
import 'package:customer/widgets/home/home_customer_2.dart';
import 'package:customer/widgets/icon_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
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
        Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconApp(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Container(
                          width: 80,
                          height: 25,
                          child: Center(
                            child: Text(
                              'NAME',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Align(
                        alignment: Alignment(0, 0),
                        child: Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35),
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text(
                              'ROLE',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 260,
                  child: Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        margin: const EdgeInsets.all(20.0),
                        child: Stack(
                          children: [
                            ScrollConfiguration(
                              behavior: CustomScrollBehavior(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:45),
                                    child: HomeCustomer(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 32,
                    top: 35,
                    child: Container(
                      height: 20,
                      width: 335,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[300],
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left:32, top: 4),
                        child: Text(
                          'FORM',
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ),
                    ))
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 500, maxWidth: 500),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        margin: const EdgeInsets.all(20.0),
                        child: Stack(
                          children: [
                            ScrollConfiguration(
                              behavior: CustomScrollBehavior(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:45),
                                    child: HomeCustomer2(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 32,
                    top: 35,
                    child: Container(
                      height: 20,
                      width: 335,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.grey[300],
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left:32, top: 4),
                        child: Text(
                          'Analysis & Review',
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ),
                    ))
              ],
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Container(
                width: 80,
                height: 32,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Color(0xffffcd29))),
                child: TextButton(
                  onPressed: () => '',
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Color(0xffffcd29)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
