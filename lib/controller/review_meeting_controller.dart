import 'dart:io';

import 'package:customer/controller/home_controller.dart';
import 'package:customer/controller/login_controller.dart';
import 'package:customer/models/review_meeting.dart';
import 'package:customer/models/type.dart';
import 'package:customer/repositories/database_provider.dart';
import 'package:customer/utils/connectivity_checker.dart';
import 'package:customer/utils/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ReviewMeetingController extends GetxController {
  final LoginController _loginController = Get.find();
  final HomeController _homeController = Get.find();
  DatabaseProvider _databaseProvider = DatabaseProvider();
  PanelController? panelController;
  final dateFormat = DateFormat('EEE, MMMM dd yyyy');
  final _picker = ImagePicker();
  final List<String> reviewMeetingTypes = [
    typeValues.reverse[ReviewMeetingType.Monthly]!,
    typeValues.reverse[ReviewMeetingType.Weekly]!
  ];
  GlobalKey<FormState>? formKey;
  TextEditingController? titleTextController;
  TextEditingController? dateTextController;
  TextEditingController? agendaTextController;
  TextEditingController? noteTextController;
  RxString dateMeeting = "".obs;
  RxString tempImagePath = "".obs;
  Rx<File> image = File("").obs;
  RxBool isPicked = false.obs;
  RxBool isUpdate = false.obs;
  RxInt radioIndex = 0.obs;
  Rx<ListReviewMeeting> listReviewMeeting = ListReviewMeeting().obs;
  String _folderName = typeValues.reverse[FolderNameImage.ReviewMeeting]!;
  bool _isConnected = false;

  @override
  void onInit() {
    _loadReviewMeeting();
    panelController = PanelController();
    formKey = GlobalKey<FormState>();
    titleTextController = TextEditingController();
    dateTextController = TextEditingController();
    agendaTextController = TextEditingController();
    noteTextController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleTextController?.dispose();
    dateTextController?.dispose();
    agendaTextController?.dispose();
    noteTextController?.dispose();
    super.onClose();
  }

  void onClosePanel() {
    resetPanel();
    WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
  }

  void resetPanel() {
    try {
      tempImagePath.value = "";
      titleTextController!.clear();
      dateTextController!.clear();
      noteTextController!.clear();
      agendaTextController!.clear();
      radioIndex.value = 0;
      isPicked.value = false;
      _isConnected = false;
      if (image.value.existsSync()) {
        image.value.delete();
        image.refresh();
      }
    } catch (e) {
      print(e);
    }
  }

  Future imageFromCamera() async {
    isPicked.value = false;
    var file = await _picker.getImage(source: ImageSource.camera);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }

  Future imageFromGallery() async {
    isPicked.value = false;
    var file =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      image = Rx<File>(File(file.path));
      image.refresh();
      isPicked.value = true;
    } else {
      print('No image selected');
    }
  }

  void _loadReviewMeeting() {
    if (_loginController.usr.value.type == 'customer') {
      _loadData(_loginController.usr.value.username!);
    } else {
      _loadData(_homeController.idCustomer.value);
    }
  }

  void _loadData(String username) async {
    _isConnected = false;
    showProgressDialog();
    try {
      _isConnected = await connectivityChecker();
      if (_isConnected) {
        var data = await _databaseProvider.loadReviewMeetingData(username);
        if (data != null) {
          listReviewMeeting.value = data;
          listReviewMeeting.refresh();
        } else {
          _isConnected = false;
        }
        print(listReviewMeeting.value.reviewMeeting![0].id);
        _closeCurrentDialog();
      }
    } catch (e) {
      _showDialog(title: "Gagal", middleText: "Data gagal di unduh.");
    }
  }

  void saveData() async {
    if (formKey!.currentState!.validate()) {
      _isConnected = false;
      showProgressDialog();
      try {
        _isConnected = await connectivityChecker();
        if (_isConnected) {
          String id = _formatTime();
          String filename = "review_" + id;
          String? path = await _databaseProvider.uploadImproveProcessImage(
              image.value,
              filename,
              _loginController.usr.value.username,
              _folderName);
          ReviewMeeting data = ReviewMeeting(
            id: id,
            tanggal: dateTextController!.text,
            nama: titleTextController!.text,
            agenda: agendaTextController!.text,
            note: noteTextController!.text,
            type: reviewMeetingTypes[radioIndex.value],
            picture: path!,
          );
          await _databaseProvider.saveDataReviewMeeting(
              data, _loginController.usr.value.username!);
          _showDialog(title: "Sukses", middleText: "Data berhasil disimpan");
        }
      } catch (e) {
        _showDialog(title: "Gagal", middleText: "Data gagal tersimpan.");
      }
    }
  }

  void deleteReviewMeeting(int index) {
    if (_loginController.usr.value.type == 'customer') {
      _deleteData(index);
    }
  }

  void _deleteData(int index) async {
    showProgressDialog();
    try {
      _isConnected = false;
      _isConnected = await connectivityChecker();
      if (_isConnected) {
        bool isDeleted = await _databaseProvider.deleteReviewMeetingData(
            reviewMeeting: listReviewMeeting.value.reviewMeeting![index],
            username: _loginController.usr.value.username);
        if (isDeleted) {
          _showDialog(title: 'Sukses', middleText: 'Data berhasil dihapus');
        } else {
          _showDialog(title: "Gagal", middleText: "Data gagal dihapus.");
        }
      }
    } catch (e) {
      _showDialog(title: "Gagal", middleText: "Data gagal dihapus.");
    }
  }

  String _formatTime() {
    var currentTime = DateTime.now().toString();
    var trim = currentTime
        .replaceAll("-", "")
        .replaceAll(" ", "")
        .replaceAll(":", "")
        .split(".");
    String formatTime = trim[0];
    return formatTime;
  }

  void _closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  _showDialog({required String title, required String middleText}) {
    _isConnected = false;
    _closeCurrentDialog();
    Get.defaultDialog(
        barrierDismissible: false,
        titleStyle: TextStyle(fontSize: 24),
        middleTextStyle: TextStyle(fontSize: 18),
        title: title,
        middleText: middleText,
        textConfirm: 'OK',
        radius: 17,
        buttonColor: Colors.yellow.shade600,
        confirmTextColor: Colors.black87,
        onConfirm: () {
          panelController!.close();
          Navigator.of(Get.overlayContext!).pop();
          _loadReviewMeeting();
          resetPanel();
        });
  }
}
