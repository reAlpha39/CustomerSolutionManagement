import 'package:customer/controller/customer_info_controller.dart';
import 'package:customer/widgets/customer_info/customer_info_card_info.dart';
import 'package:customer/widgets/customer_info/customer_info_card_other.dart';
import 'package:customer/widgets/customer_info/customer_info_card_produk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ListCustomerInfo extends StatelessWidget {
  final CustomerInfoController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List<Widget>.generate(
          _controller.listSupportUt.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: InkWell(
              onTap: () {
                _controller.fillData(index);
                _showModalBottomSheet();
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 50,
                  width: 400,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_controller.listSupportUt[index].id!),
                  ),
                ),
              ),
            ),
          ),
        ).reversed.toList(),
      ),
    );
  }

  _showModalBottomSheet() {
    return showBarModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
      context: Get.context!,
      builder: (context) => SingleChildScrollView(
        controller: PrimaryScrollController.of(context),
        child: Container(
          height: context.height - 100,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Data Customer',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Scrollbar(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                    ),
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
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
                        )
                      ],
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
