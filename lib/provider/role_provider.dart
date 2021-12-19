import 'package:dashboard_flutter/model/role_model.dart';
import 'package:flutter/cupertino.dart';

class RoleProvider extends ChangeNotifier {
  final RoleModel _roleModel = RoleModel(role: Role.user);

  get roleModel => _roleModel;

  void toAdmin() {
    _roleModel.role = Role.admin;
    notifyListeners();
  }

  void toUser() {
    _roleModel.role = Role.user;
    notifyListeners();
  }

  void changeUser() {
    _roleModel.role == Role.admin ? toUser() : toAdmin();
  }
}
