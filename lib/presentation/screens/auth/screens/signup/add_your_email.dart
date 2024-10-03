import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class AddYourEmail extends ConsumerWidget {
  final void Function() _onItemTapped;
  const AddYourEmail({super.key, required void Function() onItemTapped})
      : _onItemTapped = onItemTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Utiliza ref.watch para obtener los controladores
    final nameController = ref.watch(nameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);

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
          onTap: () {
            _onItemTapped();
          },
        )
      ],
    ));
  }
}
