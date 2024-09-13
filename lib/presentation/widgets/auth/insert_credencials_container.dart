import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class InsertCredencialsContainer extends StatelessWidget {
  const InsertCredencialsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const WritingLabel(labelText: 'Email'),
          const SizedBox(height: 10),
          const WritingLabel(
            labelText: 'Password',
            withVisibility: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: null,
                child: Text(
                  'Recover password?',
                  style: AppFonts.spaceGrotesk16.copyWith(
                    color: AppColors.lightGray,
                  ),
                )),
          ),
          PurpleButton(
            text: 'Login',
            onTap: () {
              null;
            },
          ),
        ],
      ),
    );
  }
}
