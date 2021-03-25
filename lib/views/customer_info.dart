import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/utils/custom_scroll_behavior.dart';
import 'package:customer/widgets/customer_info/customer_info_card_produk.dart';
import 'package:customer/widgets/customer_info/customer_info_card_info.dart';
import 'package:customer/widgets/customer_info/customer_info_card_other.dart';
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
              heroTag: "btn1",
              child: Icon(
                Icons.delete_outline_outlined,
                color: Color(0xffffcd29),
                size: 30,
              ),
              onPressed: () {
                showDialog('Hapus data',
                    'Apakah anda yakin ingin menghapus semua field?', 1);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 10),
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(
                Icons.save_outlined,
                color: Color(0xffffcd29),
                size: 30,
              ),
              onPressed: () {
                showDialog('Simpan data',
                    'Apakah data yang anda masukkan sudah benar?', 0);
              },
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.white,
          //color: Color(0xffffcd29),
          height: Get.height,
          child: Theme(
              data: ThemeData(primarySwatch: Colors.blueGrey),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
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
                ),
              ))),
    );
  }

  showDialog(String title, String text, int id) {
    return Get.defaultDialog(
        radius: 17,
        title: title,
        middleText: text,
        textConfirm: 'YA',
        textCancel: 'Tidak',
        confirmTextColor: Colors.black87,
        buttonColor: Color(0xffffcd29),
        cancelTextColor: Colors.black87,
        onConfirm: () {
          if (id == 0) {
            controller.validateTextField();
          } else {
            controller.clearText();
          }
          Get.back();
        },
        onCancel: () => Get.toNamed('/customer_info'));
  }
}
