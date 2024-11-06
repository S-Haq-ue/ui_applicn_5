import 'package:flutter/widgets.dart';
import 'package:ui_applicn_5/services/user_model.dart';

class CommonProvider with ChangeNotifier{
  static final CommonProvider _singleton = CommonProvider._internal();
  CommonProvider._internal();

  factory CommonProvider() {
    return _singleton;
  }
  UserDetails userData = UserDetails(name: "", email: "");
}