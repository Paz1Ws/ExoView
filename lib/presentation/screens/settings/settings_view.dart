import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final Map<IconData, String> settingsOptions = {
      FontAwesomeIcons.userAstronaut: 'Altern User Icon',
      ref.watch(themeProvider) == ThemeMode.light
          ? FontAwesomeIcons.moon
          : FontAwesomeIcons.sun: 'Theme',
      FontAwesomeIcons.language: 'Language',
      FontAwesomeIcons.bullhorn: 'Help & Support',
      FontAwesomeIcons.rightFromBracket: 'Log Out',
    };
    final size = MediaQuery.sizeOf(context);
    return Stack(
      fit: StackFit.loose,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          child: Image(
            image: const AssetImage('assets/images/profile_stars.webp'),
            width: size.width,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SettingsContent(size: size, settingsOptions: settingsOptions),
        ),
      ],
    );
  }
}
