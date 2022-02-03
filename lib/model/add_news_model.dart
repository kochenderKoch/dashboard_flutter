import 'dart:convert';

class AddNewsModel {
  String headline;
  String content;
  int status;
  AddNewsModel({
    required this.headline,
    required this.content,
    required this.status,
  });

  AddNewsModel copyWith({
    String? headline,
    String? content,
    int? status,
  }) {
    return AddNewsModel(
      headline: headline ?? this.headline,
      content: content ?? this.content,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'headline': headline,
      'content': content,
      'status': status,
    };
  }

  factory AddNewsModel.fromMap(Map<String, dynamic> map) {
    return AddNewsModel(
      headline: map['headline'] ?? '',
      content: map['content'] ?? '',
      status: map['status']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddNewsModel.fromJson(String source) =>
      AddNewsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AddNewsModel(headline: $headline, content: $content, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddNewsModel &&
        other.headline == headline &&
        other.content == content &&
        other.status == status;
  }

  @override
  int get hashCode => headline.hashCode ^ content.hashCode ^ status.hashCode;
}
