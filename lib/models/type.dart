enum ReviewMeetingType { Weekly, Monthly }
enum FolderNameImage { ImproveProcess, ReviewMeeting }

final typeValues = EnumValues({
  "weekly": ReviewMeetingType.Weekly,
  "monthly": ReviewMeetingType.Monthly,
  "improve_process/": FolderNameImage.ImproveProcess,
  "review_meeting/": FolderNameImage.ReviewMeeting,
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
