import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';

class VerifyEmailContainer extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  const VerifyEmailContainer({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '', // Remove the counter text
          ),
          onChanged: (value) {
            if (value.length == 1) {
              nextFocusNode?.requestFocus();
            } else if (value.isEmpty) {
              previousFocusNode?.requestFocus();
            }
          },
        ),
      ),
    );
  }
}
