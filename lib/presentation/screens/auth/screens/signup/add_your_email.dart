import 'package:flutter/material.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class AddYourEmail extends StatelessWidget {
  const AddYourEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpBackground(
        body: Column(
      children: [
        const WritingLabel(
          labelText: 'Email Address',
        ),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Add Email',
          onTap: () {},
        )
      ],
    ));
  }
}
