import 'package:customer/widgets/mspp/mspp_data_table.dart';
import 'package:customer/widgets/part_program/part_data_table.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsppCard extends StatelessWidget {
  final String? title;
  final String? id;
  final String? docA;
  final String? docB;
  final String? colA;
  final bool isIwTable;
  final bool dataTableFilter;
  final RxList<int>? dataTableListRadio;
  final int? dataTableRadioIndex;

  const MsppCard({
    Key? key,
    this.title,
    this.id,
    this.docA,
    this.docB,
    this.colA,
    this.dataTableFilter = false,
    this.dataTableListRadio,
    this.dataTableRadioIndex,
    this.isIwTable = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                ),
                header: Container(
                  child: Text(
                    '$title',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                collapsed: Container(),
                expanded: isIwTable
                    ? PartDataTable(
                        id: id,
                        docA: docA,
                        colA: colA,
                        docB: docB,
                        dataTableFilter: dataTableFilter,
                        dataTableListRadio: dataTableListRadio,
                        dataTableRadioIndex: dataTableRadioIndex,
                      )
                    : MsppDataTable(
                        id: id,
                        docA: docA,
                        colA: colA,
                        docB: docB,
                        dataTableFilter: dataTableFilter,
                        dataTableListRadio: dataTableListRadio,
                        dataTableRadioIndex: dataTableRadioIndex,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
