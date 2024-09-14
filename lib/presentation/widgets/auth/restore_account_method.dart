import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class RestorePasswordMethod extends StatelessWidget {
  final IconData icon;
  final String text;
  // final String personalData;
  const RestorePasswordMethod({
    required this.icon,
    required this.text,
    //  required this.personalData,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        null;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.darkGray),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.darkGray,
              size: 32,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                    style: AppFonts.spaceGrotesk16.copyWith(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 5),
                // +99999999
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
