import 'package:customer/views/mainPage.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 20,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
              style:
                  ButtonStyle(elevation: MaterialStateProperty.all<double>(0)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Login", style: TextStyle(fontSize: 20)),
              ),
              onPressed: () {
                mainPage(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

mainPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
}
