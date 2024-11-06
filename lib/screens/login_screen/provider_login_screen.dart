import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ui_applicn_5/Provider/common_provider.dart';
import 'package:ui_applicn_5/services/auth_service.dart';
import 'package:ui_applicn_5/services/user_model.dart';

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
    if (!_formKey.currentState!.validate()) {
      return null;
    }
    _isLoading = true;
    notifyListeners();
    try {
      var userId = await AuthService().login(email: _emailController.text, password: _passwordController.text);
      final userData = await FirebaseFirestore.instance.collection("users").doc(userId).get();
      CommonProvider commonProvider = CommonProvider();
      commonProvider.userData = UserDetails(name: userData["name"], email: userData["email"]);
      _isLoading = false;
      notifyListeners();
      return "Auth Success";
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }

  Future<String?> googleSignIn() async {
    try {
      var abc = await AuthService().googleSignIn();
      CommonProvider commonProvider = CommonProvider();
      commonProvider.userData = UserDetails(name: abc?.displayName ?? "", email: abc?.email ?? "");
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
