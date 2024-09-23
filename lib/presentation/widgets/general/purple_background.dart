import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/home/my_bottom_navigator_bar.dart';

class PurpleBackground extends StatelessWidget {
  final Widget body;
  final EdgeInsets? padding;
  final bool withAppBar;
  final bool withNavigation;
  final String appBarTitle;
  final void Function(int) onTap;
  final int currentIndex;
  const PurpleBackground(
      {super.key,
      required this.body,
      required this.onTap,
      required this.currentIndex,
      this.padding,
      this.withAppBar = false,
      this.withNavigation = true,
      this.appBarTitle = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.veryDarkPurple,
      extendBodyBehindAppBar: true,
      appBar: withAppBar
          ? AppBar(
              title: Text(appBarTitle, style: AppFonts.spaceGrotesk18),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : null,
      bottomNavigationBar: withNavigation
          ? MyBottomNavigationBar(
              onTap: onTap,
              currentIndex: currentIndex,
            )
          : null,
      body: body,
    );
  }
}
