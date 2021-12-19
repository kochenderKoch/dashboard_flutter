import 'dart:convert';

enum Role { admin, user }

class RoleModel {
  Role role;
  RoleModel({
    required this.role,
  });

  RoleModel copyWith({
    Role? role,
  }) {
    return RoleModel(
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'role': role.toString(),
    };
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      role: map['role'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleModel.fromJson(String source) =>
      RoleModel.fromMap(json.decode(source));

  @override
  String toString() => 'RoleModel(role: $role)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoleModel && other.role == role;
  }

  @override
  int get hashCode => role.hashCode;

  bool isAdmin() => role == Role.admin;
}
