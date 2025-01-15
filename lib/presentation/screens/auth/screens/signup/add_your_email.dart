import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:myapp/utils/validation_utils.dart';

class AddYourEmail extends ConsumerWidget {
  final void Function() _onItemTapped;
  const AddYourEmail({super.key, required void Function() onItemTapped})
      : _onItemTapped = onItemTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);

    void validateAndProceed() {
      if (ValidationUtils.isEmailValid(emailController.text) &&
          nameController.text.isNotEmpty) {
        _onItemTapped();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in both name and a valid email')),
        );
      }
    }

    return SignUpBackground(
        body: Column(
      children: [
        WritingLabel(controller: nameController, labelText: 'Name'),
        const SizedBox(
          height: 10,
        ),
        WritingLabel(controller: emailController, labelText: 'Email'),
        const SizedBox(
          height: 10,
        ),
        PurpleButton(
          text: 'Add Email',
          onTap: validateAndProceed,
        )
      ],
    ));
  }
}
