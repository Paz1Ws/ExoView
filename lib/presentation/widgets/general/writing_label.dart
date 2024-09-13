import 'package:flutter/material.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';

class WritingLabel extends StatelessWidget {
  final String labelText;
  final bool withVisibility;
  const WritingLabel(
      {super.key, required this.labelText, this.withVisibility = false});

  @override
  Widget build(BuildContext context) {
    bool obscureText = true;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.darkGray,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
            labelStyle:
                AppFonts.spaceGrotesk18.copyWith(color: AppColors.lightGray),
            suffixIcon: withVisibility
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,
          ),
          style: const TextStyle(color: Colors.grey),
        );
      },
    );
  }
}
