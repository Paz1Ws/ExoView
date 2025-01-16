import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

class ValidationUtils {
  static bool arePasswordsMatching(String password, String verifyPassword) {
    return password == verifyPassword;
  }

  static void showPasswordMismatchAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Text(
                'Passwords do not match!',
                style: AppFonts.spaceGrotesk20.copyWith(
                    color: AppColors.veryDarkPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please make sure both passwords are the same.',
                textAlign: TextAlign.center,
                style:
                    AppFonts.spaceGrotesk16.copyWith(color: AppColors.darkGray),
              ),
            ],
          ),
        );
      },
    );
  }

  static bool isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }
}
