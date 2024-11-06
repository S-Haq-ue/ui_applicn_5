import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ui_applicn_5/Provider/common_provider.dart';
import 'package:ui_applicn_5/services/auth_service.dart';
import 'package:ui_applicn_5/services/user_model.dart';

class RegistrationScreenProvider with ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _forgetpasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisibility = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get nameController => _nameController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get forgetpasswordFocusNode => _forgetpasswordFocusNode;
  FocusNode get nameFocusNode => _nameFocusNode;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isLoading;
  bool get passwordVisibility => _passwordVisibility;

  void changepasswodVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  Future<String?> register() async {
    if (!_formKey.currentState!.validate()) {
      return null;
    }
    _isLoading = true;
    notifyListeners();
    try {
      var userId = await AuthService().signUp(email: _emailController.text, password: _passwordController.text);
      //store user details in firestore
      FirebaseFirestore.instance.collection("users").doc(userId).set({
        "name": _nameController.text,
        "email": _emailController.text,
      });
      CommonProvider commonProvider = CommonProvider();
      commonProvider.userData = UserDetails(
        name: _nameController.text,
        email: _emailController.text,
      );
      _isLoading = false;
      notifyListeners();
      return "Auth Success";
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _forgetpasswordFocusNode.dispose();
    _nameController.dispose();
    _nameFocusNode.dispose();
    super.dispose();
  }
}
