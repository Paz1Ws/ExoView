import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

class SignUpBackground extends StatefulWidget {
  const SignUpBackground({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  State<SignUpBackground> createState() => _SignUpBackgroundState();
}

class _SignUpBackgroundState extends State<SignUpBackground> {
  final Image purpleBackground =
      Image.asset('assets/images/purple_background.webp', fit: BoxFit.cover);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(purpleBackground.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: purpleBackground,
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: widget.body,
                ),
              ),
              const Spacer(),
              Text(
                  'By using ExoView, you agree to our Terms of Service and Privacy Policy',
                  textAlign: TextAlign.center,
                  style: AppFonts.spaceGrotesk16
                      .copyWith(color: AppColors.lightGray)),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
