import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:flutter/material.dart';

class ReviewMainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 400,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 6,
                child: Container(
                  height: 190,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              "Weekly",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Scrollbar(
                          thickness: 1,
                          child: ScrollConfiguration(
                            behavior: CustomScrollBehavior(),
                            child: SingleChildScrollView(
                              child: Text("Text"),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Container(
                            height: 1,
                            width: 200,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Note:",
                            style: TextStyle(fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: 180,
                              height: 30,
                              child: ScrollConfiguration(
                                behavior: CustomScrollBehavior(),
                                child: SingleChildScrollView(
                                  child: Text(
                                    "",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: Image.asset(
                      "assets/images/no_image.jpg",
                      fit: BoxFit.cover,
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
}
