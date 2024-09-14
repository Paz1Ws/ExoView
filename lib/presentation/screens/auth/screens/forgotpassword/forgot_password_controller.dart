import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import 'package:myapp/presentation/screens/screens.dart';

class PasswordResetController extends StatefulWidget {
  const PasswordResetController({
    super.key,
  });

  @override
  State<PasswordResetController> createState() =>
      _PasswordResetControllerState();
}

class _PasswordResetControllerState extends State<PasswordResetController> {
  List<Widget> pages = [
    const ForgotPassword(),
    const VerifyEmail(),
    const CreateYourPassword(
      recoverPassword: true,
    ),
  ];

  List<String> titles = [
    'Verify email ',
    'Create your password ',
  ];

  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.veryLightGray,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PageView(
        children: pages,
      ),
    );
  }
}
