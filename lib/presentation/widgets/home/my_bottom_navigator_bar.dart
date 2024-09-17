import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/colors.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.veryDarkPurple,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.brightTealGreen,
      selectedIconTheme: const IconThemeData(color: AppColors.brightTealGreen),
      unselectedItemColor: AppColors.veryLightGray,
      unselectedIconTheme: const IconThemeData(color: AppColors.veryLightGray),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.rocket),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.wpexplorer),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.star),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userAstronaut),
          label: 'Profile',
        ),
      ],
    );
  }
}
