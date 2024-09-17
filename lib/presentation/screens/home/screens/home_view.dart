import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PurpleBackground(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GSD.2163.08.15.01.40',
              style: AppFonts.spaceGrotesk16,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'List of the 8 most famous exoplanets',
              style: AppFonts.spaceGrotesk12,
            )
          ],
        ),
      ),
    );
  }
}
