import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_applicn_5/services/auth_service.dart';

class LoginScreenProvider with ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _forgetpasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisibility = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get forgetpasswordFocusNode => _forgetpasswordFocusNode;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isLoading;
  bool get passwordVisibility => _passwordVisibility;

  void changepasswodVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  Future<String?> login() async {
    var status = await AuthService().login(email: _emailController.text, password: _passwordController.text);
    return status;
  }

  Future<String?> googleSignIn() async {
    try {
      await AuthService().googleSignIn();
      return "Auth Success";
    } on FirebaseAuthException catch (e) {
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
    super.dispose();
  }
}
