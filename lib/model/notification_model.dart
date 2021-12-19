import 'dart:convert';

class NotificationModel {
  String date;
  String title;
  String subtitile;
  String status;
  NotificationModel({
    required this.date,
    required this.title,
    required this.subtitile,
    required this.status,
  });

  NotificationModel copyWith({
    String? date,
    String? title,
    String? subtitile,
    String? status,
  }) {
    return NotificationModel(
      date: date ?? this.date,
      title: title ?? this.title,
      subtitile: subtitile ?? this.subtitile,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
      'subtitile': subtitile,
      'status': status,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      date: map['date'] ?? '',
      title: map['title'] ?? '',
      subtitile: map['subtitile'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NotificationModel(date: $date, title: $title, subtitile: $subtitile, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NotificationModel &&
        other.date == date &&
        other.title == title &&
        other.subtitile == subtitile &&
        other.status == status;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        title.hashCode ^
        subtitile.hashCode ^
        status.hashCode;
  }
}
