import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/settings/providers/settings_providers.dart';
import 'package:myapp/presentation/widgets/settings/settigns_options_selector.dart';

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
    return FutureBuilder(
      future: _getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final name = snapshot.data;
          return _buildContent(context, ref, name);
        }
      },
    );
  }

  Future<dynamic> _getUserName() async {
    final box = await Hive.openBox('credentialsBox');
    return box.get('name');
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, String? name) {
    final userIcon = ref.watch(userIconProvider);
    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                image: DecorationImage(
                  image: AssetImage(userIcon),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name ?? 'Guest',
              textAlign: TextAlign.center,
              style: AppFonts.spaceGrotesk30.copyWith(
                color: AppColors.softPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.15,
              width: size.width * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
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
                      scale: 1.5,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
