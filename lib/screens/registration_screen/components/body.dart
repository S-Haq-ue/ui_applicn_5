import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/screens/login_screen/login_screen.dart';
import 'package:ui_applicn_5/screens/registration_screen/provider_registration_screen.dart';
import 'package:ui_applicn_5/widgets/custom_button.dart';
import 'package:ui_applicn_5/widgets/custome_text_field.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationScreenProvider>(
      builder: (context, registrationScreenProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: registrationScreenProvider.formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingValue),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextField(
                          hintText: 'email Id',
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: backgroundColor,
                          ),
                          controller: registrationScreenProvider.emailController,
                          focusNode: registrationScreenProvider.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          validator: (mobile) {
                            if (mobile!.isEmpty) {
                              return 'Please enter mobile number';
                            } else if (int.tryParse(mobile) == null || mobile.length != 9) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'Name',
                          keyboardType: TextInputType.name,
                          suffixIcon: const Icon(
                            Icons.person,
                            color: backgroundColor,
                          ),
                          controller: registrationScreenProvider.nameController,
                          focusNode: registrationScreenProvider.nameFocusNode,
                          textInputAction: TextInputAction.next,
                          validator: (mobile) {
                            if (mobile!.isEmpty) {
                              return 'Please enter mobile number';
                            } else if (int.tryParse(mobile) == null || mobile.length != 9) {
                              return 'Please enter a valid mobile number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          maxLength: 20,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            onPressed: () => registrationScreenProvider.changepasswodVisibility(),
                            icon: Icon(
                              registrationScreenProvider.passwordVisibility ? Icons.visibility : Icons.visibility_off,
                              color: backgroundColor,
                            ),
                          ),
                          controller: registrationScreenProvider.passwordController,
                          focusNode: registrationScreenProvider.passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          obscureText: registrationScreenProvider.passwordVisibility,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'Please enter password';
                            } else if (password.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          // onFieldSubmitted: (mobile) async =>
                          //     loginClick(context: context, loginFuction: registrationScreenProvider.login),
                        ),const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: 'Confirm Password',
                          maxLength: 20,
                          keyboardType: TextInputType.visiblePassword,
                          controller: registrationScreenProvider.confirmPasswordController,
                          focusNode: registrationScreenProvider.confirmPasswordFocusNode,
                          textInputAction: TextInputAction.done,
                          validator: (password) {
                            if (password!.isEmpty) {
                              return 'Please enter password';
                            } else if (password.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          // onFieldSubmitted: (mobile) async =>
                          //     loginClick(context: context, loginFuction: registrationScreenProvider.login),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          isLoading: registrationScreenProvider.isLoading,
                          onPressed: () {},
                          // onPressed: () => loginClick(context: context, loginFuction: registrationScreenProvider.login),
                          child: const Text(
                            'Register',
                            textScaler: TextScaler.linear(1),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.classId);
                          },
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.center,
                          ),
                          child: const Text(
                            'Login',
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(color: secondaryColor),
                          ),
                        ),
                        const Text(
                          "Or",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(color: secondaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () {}, icon: Brand(Brands.google)),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(onPressed: () {}, icon: Brand(Brands.twitterx_2)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void loginClick({required BuildContext context, required Future<String?> Function() loginFuction}) async {
    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).clearSnackBars();
    try {
      String? loginStatus = await loginFuction();
      if (loginStatus == 'Login successful') {
        // ignore: use_build_context_synchronously
        // context.goNamed(
        //   HomeScreen.classId,
        //   extra: {
        //     'isLogingIn': true,
        //   },
        // );
      } else if (loginStatus == null) {
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              loginStatus,
              textScaler: const TextScaler.linear(1),
            ),
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      debugPrint(e.toString());
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Something went wrong, please contact support',
            textScaler: TextScaler.linear(1),
          ),
        ),
      );
    }
  }
}
