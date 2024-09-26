import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/home/my_bottom_navigator_bar.dart';

class PurpleBackground extends StatelessWidget {
  final Widget body;
  final bool withAppBar;
  final bool withNavigation;
  final String appBarTitle;
  final void Function(int)? onTap;
  final int? currentIndex;
  const PurpleBackground(
      {super.key,
      required this.body,
      this.onTap,
      this.currentIndex,
      this.withAppBar = false,
      this.withNavigation = true,
      this.appBarTitle = ''});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: null,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 25, 15, 34),
                AppColors.veryDarkPurple,
                Color.fromARGB(255, 44, 32, 56),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: body,
        ),
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
                currentIndex: currentIndex!,
              )
            : null,
      ),
    );
  }
}
