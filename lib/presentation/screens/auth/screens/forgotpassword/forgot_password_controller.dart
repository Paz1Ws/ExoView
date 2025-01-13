import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

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
    //const VerifyEmail(),
    //  CreateYourPassword(
    //   recoverPassword: true,
    // ),
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
          icon: Icon(
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
