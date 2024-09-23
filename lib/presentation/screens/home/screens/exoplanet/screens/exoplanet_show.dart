import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExoplanetShow extends StatelessWidget {
  final String nickName;
  final String name;
  const ExoplanetShow({super.key, required this.nickName, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            nickName,
            style: AppFonts.spaceGrotesk18,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: AppFonts.spaceGrotesk12.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
      PurpleButton(text: 'Start Exploring', onTap: () {}),
    ]);
  }
}
