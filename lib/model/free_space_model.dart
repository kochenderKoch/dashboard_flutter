import 'dart:convert';

class FreeSpaceModel {
  int free_space;
  FreeSpaceModel({
    required this.free_space,
  });

  FreeSpaceModel copyWith({
    int? free_space,
  }) {
    return FreeSpaceModel(
      free_space: free_space ?? this.free_space,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'free_space': free_space,
    };
  }

  factory FreeSpaceModel.fromMap(Map<String, dynamic> map) {
    return FreeSpaceModel(
      free_space: map['free_space']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FreeSpaceModel.fromJson(String source) =>
      FreeSpaceModel.fromMap(json.decode(source));

  @override
  String toString() => 'FreeSpaceModel(free_space: $free_space)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FreeSpaceModel && other.free_space == free_space;
  }

  @override
  int get hashCode => free_space.hashCode;
}
