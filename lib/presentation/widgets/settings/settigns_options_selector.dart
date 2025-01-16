import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/screens/onboarding/welcome_screen.dart';
import 'package:myapp/presentation/screens/settings/providers/settings_providers.dart';

import 'package:url_launcher/url_launcher.dart';

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
    final themeMode = ref.watch(themeProvider);
    return GestureDetector(
        onTap: () {
          switch (text) {
            case 'Log Out':
              ref.read(themeProvider.notifier).setDarkMode();
              ref.read(authRepositoryProvider).signOut();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const WelcomeScreen()));
              break;
            case 'Theme':
              ref.read(themeProvider.notifier).toggleTheme();
              break;
            case 'Altern User Icon':
              ref.read(userIconProvider.notifier).alternateIcon();
              break;

            case 'Language':
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        '🌐 For now only English, this is a 1.0 Version 🌐\n🇺🇸 Por ahora solo ingles, se lanzarán siguientes versiones. 🇺🇸')),
              );
              break;
            case 'Help & Support':
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.veryDarkPurple,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            '❓ Do you want to know the developer? ❓\n',
                            style: AppFonts.spaceGrotesk16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightGray,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: SelectableText(
                            '👉 Click here 👈',
                            style: AppFonts.spaceGrotesk16.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.brightTealGreen),
                            textAlign: TextAlign.center,
                            onTap: () async {
                              const url =
                                  'https://linkedin.com/in/christopher-paz-leon-745760202/';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hello, if you have any questions or need help,send me feedback in private or on the comments of the Store.\nI hope you enjoy Exoview!',
                          style: AppFonts.spaceGrotesk16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightGray),
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
            Expanded(
              child: Icon(
                icon == Icons.brightness_6
                    ? (themeMode == ThemeMode.light
                        ? Icons.wb_sunny
                        : Icons.nights_stay)
                    : icon,
                color: AppColors.brightTealGreen,
              ),
            ),
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
