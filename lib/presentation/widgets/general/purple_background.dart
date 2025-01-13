import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Theme.of(context).brightness == Brightness.dark
                    ? [
                        AppColors.purple,
                        AppColors.veryDarkPurple,
                        AppColors.veryDarkPurple,
                        AppColors.veryDarkPurple,
                        AppColors.purple,
                      ]
                    : [
                        AppColors.veryDarkPurple,
                        AppColors.veryDarkPurple,
                        AppColors.veryDarkPurple,
                        AppColors.purple,
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: Theme.of(context).brightness == Brightness.dark
                    ? [0.1, 0.12, 0.5, 0.9, 0.95]
                    : [0.1, 0.5, 0.8, 0.95]),
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
                  icon: Icon(
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
