import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class CreateYourPassword extends StatelessWidget {
  const CreateYourPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
        body: Column(
      children: [
        const WritingLabel(
          labelText: 'Create your password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const WritingLabel(
          labelText: 'Confirm password',
          withVisibility: true,
        ),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Create Account',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SuccesfulAccountCreation()));
          },
        )
      ],
    ));
  }
}
