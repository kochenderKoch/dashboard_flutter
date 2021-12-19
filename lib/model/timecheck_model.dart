import 'dart:convert';

class TimecheckModel {
  String user;
  int timestamp;
  String status = "OK";

  TimecheckModel({
    required this.user,
    required this.timestamp,
  });

  TimecheckModel copyWith({
    String? user,
    int? timestamp,
  }) {
    return TimecheckModel(
      user: user ?? this.user,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'timestamp': timestamp,
    };
  }

  factory TimecheckModel.fromMap(Map<String, dynamic> map) {
    return TimecheckModel(
      user: map['user'] ?? '',
      timestamp: map['timestamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimecheckModel.fromJson(String source) =>
      TimecheckModel.fromMap(json.decode(source));

  @override
  String toString() => 'TimecheckModel(user: $user, timestamp: $timestamp)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimecheckModel &&
        other.user == user &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => user.hashCode ^ timestamp.hashCode;
}
