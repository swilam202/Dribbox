import 'package:dribbox/core/resources/color%20manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorManager.blueColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 16,
                ),
              ),
            ),
            onPressed: onPressed,
            child: child,
          ),
        ),
      ],
    );
  }
}
