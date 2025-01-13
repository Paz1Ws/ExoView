import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                focalRadius: 0.2,
                radius: 1.5,
                focal: Alignment.topCenter,
                colors: [AppColors.brightPurple, AppColors.veryDarkPurple],
                stops: [0.0, 0.1],
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: body,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
