import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/screens/auth/providers/sign_up_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class AddYourEmail extends ConsumerWidget {
  final void Function() _onItemTapped;
  const AddYourEmail({super.key, required void Function() onItemTapped})
      : _onItemTapped = onItemTapped;

  @override
  Widget build(BuildContext context, ref) {
    return SignUpBackground(
        body: Column(
      children: [
        WritingLabel(
            controller: ref.watch(nameControllerProvider), labelText: 'Name'),
        const SizedBox(
          height: 10,
        ),
        WritingLabel(
            controller: ref.watch(emailControllerProvider), labelText: 'Email'),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Add Email',
          onTap: () {
            _onItemTapped();
          },
        )
      ],
    ));
  }
}
