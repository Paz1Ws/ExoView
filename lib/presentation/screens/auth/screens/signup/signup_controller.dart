import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

import 'package:myapp/presentation/screens/screens.dart';

class SignUpController extends StatefulWidget {
  const SignUpController({
    super.key,
  });

  @override
  State<SignUpController> createState() => _SignUpControllerState();
}

class _SignUpControllerState extends State<SignUpController> {
  final PageController _pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      title = titles[index];
    });
    dotIndex = index;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<String> titles = [
    'Add your email 1/3',
    'Create your password 2/3',
    'Verify email 4/3',
  ];

  String title = 'Add your email 1/3';
  int dotIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      AddYourEmail(
        onItemTapped: () {
          _onItemTapped(1);
        },
      ),
      CreateYourPassword(
        onItemTapped: () {
          _onItemTapped(2);
        },
      ),
      const VerifyEmail(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(title, style: AppFonts.spaceGrotesk18),
            DotsIndicator(
              dotsCount: 3,
              position: dotIndex,
              decorator: DotsDecorator(
                color: Colors.grey,
                activeColor: AppColors.softPurple,
                size: const Size(12.0, 12.0),
                activeSize: const Size(12.0, 12.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
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
        controller: _pageController,
        children: pages,
      ),
    );
  }
}
