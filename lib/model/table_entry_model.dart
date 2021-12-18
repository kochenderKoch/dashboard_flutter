import 'dart:convert';

class TableEntryModel {
  String name;
  String path;
  String date;
  String status;
  String size;

  TableEntryModel({
    required this.name,
    required this.path,
    required this.date,
    required this.status,
    required this.size,
  });

  TableEntryModel copyWith({
    String? name,
    String? path,
    String? date,
    String? status,
    String? size,
  }) {
    return TableEntryModel(
      name: name ?? this.name,
      path: path ?? this.path,
      date: date ?? this.date,
      status: status ?? this.status,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'date': date,
      'status': status,
      'size': size,
    };
  }

  factory TableEntryModel.fromMap(Map<String, dynamic> map) {
    return TableEntryModel(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      size: map['size'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TableEntryModel.fromJson(String source) =>
      TableEntryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TableEntryModel(name: $name, path: $path, date: $date, status: $status, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TableEntryModel &&
        other.name == name &&
        other.path == path &&
        other.date == date &&
        other.status == status &&
        other.size == size;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        path.hashCode ^
        date.hashCode ^
        status.hashCode ^
        size.hashCode;
  }
}
