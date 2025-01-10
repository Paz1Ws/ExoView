import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/screens/onboarding/welcome_screen.dart';

class SettingsContent extends ConsumerWidget {
  final Map<IconData, String> settingsOptions;
  const SettingsContent({
    super.key,
    required this.settingsOptions,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'John Doe',
              style: AppFonts.spaceGrotesk40.copyWith(
                color: AppColors.softPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.15,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Image.asset(
                      'assets/images/profile_planet.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ref.watch(visitedExoplanetsProvider).toString(),
                          textAlign: TextAlign.center,
                          style: AppFonts.spaceGrotesk30.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.veryDarkPurple,
                          ),
                        ),
                        Text(
                          'Exoplanets visited',
                          textAlign: TextAlign.center,
                          style: AppFonts.spaceGrotesk16.copyWith(
                            color: AppColors.veryDarkPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Column(
                children: List.generate(5, (index) {
              return Column(
                children: [
                  SettingsOptionSelector(
                    icon: settingsOptions.keys.toList()[index],
                    text: settingsOptions.values.toList()[index],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            })),
          ],
        ),
      ),
    );
  }
}

class SettingsOptionSelector extends ConsumerWidget {
  final IconData icon;
  final String text;
  const SettingsOptionSelector({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
        onTap: () {
          switch (text) {
            case 'Log Out':
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WelcomeScreen()));
              break;
            case 'Theme':
              ref.read(themeProvider.notifier).toggleTheme();
              break;
            case 'Altern User Icon':
              // Handle Altern User Icon action
              break;

            case 'Language':
              // Handle Language action
              break;
            case 'Help & Support':
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.veryDarkPurple,
                    title: Text(
                      'Help & Support',
                      style: AppFonts.spaceGrotesk16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightGray),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Developed By: Christopher Paz León',
                          style: AppFonts.spaceGrotesk16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SelectableText(
                          'Linkedin: linkedin.com/in/christopher-paz-leon-745760202/',
                          style: AppFonts.spaceGrotesk16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.brightTealGreen),
                          textAlign: TextAlign.start,
                        ),
                        SelectableText(
                          'Email: rewardmnx@gmail.com',
                          style: AppFonts.spaceGrotesk16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.brightTealGreen),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hello, if you have any questions or need help, you can send me feedback by email or LinkedIn, also I\'m pending to comments on Play Store I hope you enjoy Exoview!',
                          style: AppFonts.spaceGrotesk16
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: AppFonts.spaceGrotesk12
                              .copyWith(color: AppColors.brightTealGreen),
                        ),
                      ),
                    ],
                  );
                },
              );
              break;
            default:
              break;
          }
        },
        child: Row(
          children: [
            Expanded(child: Icon(icon, color: AppColors.brightTealGreen)),
            Expanded(
              child: Text(
                text,
                style: AppFonts.spaceGrotesk20.copyWith(
                  color: AppColors.veryLightGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
