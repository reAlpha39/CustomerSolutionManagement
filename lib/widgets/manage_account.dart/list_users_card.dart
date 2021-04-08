import 'package:customer/controller/manage_account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUsersCard extends StatelessWidget {
  final ManageAccountController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 48),
        child: Container(
          height: context.height * 0.7,
          padding: EdgeInsets.all(12),
          constraints: BoxConstraints(
            maxWidth: 600,
            minWidth: 600,
            maxHeight: 1000,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: 0,
                sortAscending: true,
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Username')),
                  DataColumn(label: Text('Password')),
                  DataColumn(label: Text('Type')),
                ],
                rows: controller.listUser
                    .map(
                      (user) => DataRow(
                        cells: [
                          DataCell(
                            Container(
                              width: 100,
                              child: Text(
                                '${user.nama}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            showEditIcon: true,
                            onTap: () {}
                          ),
                          DataCell(
                            Container(
                              width: 100,
                              child: Text(
                                '${user.username}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              width: 100,
                              child: Text(
                                '${user.password}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          DataCell(
                            Container(
                              width: 100,
                              child: Text(
                                '${user.type}',
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
