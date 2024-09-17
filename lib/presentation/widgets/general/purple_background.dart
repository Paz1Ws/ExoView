import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/home/my_bottom_navigator_bar.dart';

class PurpleBackground extends StatelessWidget {
  final Widget body;
  const PurpleBackground({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      extendBody: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.veryDarkPurple,
        child: body,
      ),
    );
  }
}
