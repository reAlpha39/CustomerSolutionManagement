import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/widgets/customer_info_card_produk.dart';
import 'package:customer/widgets/customer_info_card_info.dart';
import 'package:customer/widgets/customer_info_card_other.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerInfo extends StatelessWidget {
  final CustomerInfoController controller = CustomerInfoController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Data Customer',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: FloatingActionButton(
              child: Icon(
                Icons.delete_outline_outlined,
                color: Colors.yellow.shade700,
                size: 30,
              ),
              onPressed: () {
                var formP = controller.formKeyProduk.currentState;
                var formC = controller.formKeyCustomer.currentState;
                var formO = controller.formKeyOther.currentState;
                if (formC.validate() || formP.validate() || formO.validate()) {
                  formC.save();
                  formP.save();
                  formO.save();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: FloatingActionButton(
              child: Icon(
                Icons.save_outlined,
                color: Colors.yellow.shade700,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.yellow.shade600,
          height: Get.height,
          child: Theme(
              data: ThemeData(primarySwatch: Colors.blueGrey),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomerInfoCardInfo(),
                      CustomerInfoCardProduk(),
                      CustomerInfoCardOther(),
                    ],
                  ),
                ),
              ))),
    );
  }
}
