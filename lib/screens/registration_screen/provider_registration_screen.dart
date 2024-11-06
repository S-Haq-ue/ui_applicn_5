import 'package:flutter/material.dart';
import 'package:ui_applicn_5/services/auth_service.dart';

class RegistrationScreenProvider with ChangeNotifier {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _forgetpasswordFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisibility = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get nameController => _nameController;
  TextEditingController get confirmPasswordController => _confirmPasswordController;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get forgetpasswordFocusNode => _forgetpasswordFocusNode;
  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get confirmPasswordFocusNode => _confirmPasswordFocusNode;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isLoading;
  bool get passwordVisibility => _passwordVisibility;

  void changepasswodVisibility() {
    _passwordVisibility = !_passwordVisibility;
    notifyListeners();
  }

  Future<String?> register() async {
    _isLoading = true;
    notifyListeners();
    try {
      var status = await AuthService().signUp(email: _emailController.text, password: _passwordController.text);

      
      _isLoading = false;
      notifyListeners();
      return status;
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
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }
}
