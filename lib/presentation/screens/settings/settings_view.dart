import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';

class SettingsView extends StatelessWidget {
  // final User user;
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<IconData, String> settingsOptions = {
      FontAwesomeIcons.userAstronaut: 'Edit Profile',
      FontAwesomeIcons.bell: 'Notifications',
      FontAwesomeIcons.moon: 'Theme',
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

class SettingsContent extends StatelessWidget {
  final Map<IconData, String> settingsOptions;
  const SettingsContent({
    super.key,
    required this.settingsOptions,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                          '27',
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
                children: List.generate(6, (index) {
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

class SettingsOptionSelector extends StatelessWidget {
  final IconData icon;
  final String text;
  const SettingsOptionSelector({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('Settings option selected');
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
  // FutureBuilder<String>(
  //         future: fetchImageUrlFromDatabase(), // Replace with your method to fetch the image URL
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return CircularProgressIndicator();
  //           } else if (snapshot.hasError) {
  //             return Text('Error: ${snapshot.error}');
  //           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
  //             return Text('No image available');
  //           } else {
  //             return Container(
  //         padding: const EdgeInsets.all(20),
  //         child: Image.network(snapshot.data!),
  //             );
  //           }
  //         },
  //       ),