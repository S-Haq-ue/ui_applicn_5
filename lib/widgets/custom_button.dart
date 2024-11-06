import 'package:flutter/material.dart';
import 'package:ui_applicn_5/const_file.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final void Function()? onPressed;
  final Widget? child;
  const CustomButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          )
        : ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: child,
            ),
          );
  }
}
