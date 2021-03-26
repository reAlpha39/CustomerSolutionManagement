import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> connectivityChecker() async {
  bool hasConnection = false;
  hasConnection = await DataConnectionChecker().hasConnection.then((value) {
    if (!value) {
      
      Get.defaultDialog(
          title: 'Koneksi Error',
          middleText: 'Periksa kembali koneksi internet anda',
          textConfirm: 'OK',
          confirmTextColor: Colors.black87,
          onConfirm: () => Get.back());
    }
    return value;
  });
  return hasConnection;
}
