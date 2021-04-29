import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MsppFillHelper extends StatelessWidget {
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
                  hasIcon: false,
                ),
                header: Container(
                  child: Text(
                    'Klik disini sebelum mengisi data.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                collapsed: Container(),
                expanded: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("\nMemilih 'Yes' pada bagian Assessment Result," +
                      " maka remark yang diisi adalah 'OK'." +
                      "\n\nApabila memilih 'No' atau 'N/A'," +
                      " maka remark harus diisi."),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
