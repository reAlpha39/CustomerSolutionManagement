import 'package:customer/controller/review_meeting_controller.dart';
import 'package:customer/widgets/review_meeting/review_meeting_radio.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ReviewPanelContent extends StatelessWidget {
  final ReviewMeetingController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DateTimeField(
                  controller: _controller.dateTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    labelText: "Date Meeting",
                  ),
                  readOnly: true,
                  format: _controller.dateFormat,
                  initialValue: DateTime.now(),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                  onSaved: (value) {
                    _controller.dateMeeting.value =
                        _controller.dateFormat.format(value!);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller.titleTextController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      labelText: "Title Meeting"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller.agendaTextController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      labelText: "Agenda Meeting"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  child: ExpandableNotifier(
                    child: ScrollOnExpand(
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToExpand: true,
                          tapBodyToCollapse: true,
                          hasIcon: true,
                          iconPlacement: ExpandablePanelIconPlacement.right,
                        ),
                        header: Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Type Meeting',
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        collapsed: Container(),
                        expanded: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 10,
                          ),
                          child: ReviewMeetingRadio(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller.noteTextController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    labelText: "Note Meeting",
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Obx(
                      () => !_controller.isPicked.value
                          ? _controller.isUpdate.value
                              ? PreviewImage(
                                  pathPicture: _controller.tempImagePath.value,
                                )
                              : PreviewImage()
                          : ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(17),
                              ),
                              child: Image.file(
                                _controller.image.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => _controller.imageFromCamera(),
                      child: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineIcons.camera,
                              color: Color(0xff4c3d0c),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Camera',
                                style: TextStyle(
                                  color: Color(0xff4c3d0c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => _controller.imageFromGallery(),
                      child: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LineIcons.sdCard,
                              color: Color(0xff4c3d0c),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'SD Card',
                                style: TextStyle(
                                  color: Color(0xff4c3d0c),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PreviewImage extends StatelessWidget {
  final String? pathPicture;

  const PreviewImage({Key? key, this.pathPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: pathPicture != "" && pathPicture != null
          ? ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(17),
              ),
              child: Image.network(
                pathPicture!,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : LinearProgressIndicator();
                },
                fit: BoxFit.cover,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Photo Meeting',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}
