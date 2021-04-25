import 'package:flutter/material.dart';

class ImproveMainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 100,
              child: Text("Before"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 100,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 50,
                    maxWidth: 100,
                    minHeight: 50,
                    maxHeight: 100,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(17)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/service_program.png'),
                      ),
                    ),
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
