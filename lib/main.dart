import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/init_dependencies.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'presentation/screens/onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  // final List<String> testDeviceIds = ['2879BF2D0AA1FCE2724E65A01D17EC65'];
  // final RequestConfiguration configuration = RequestConfiguration(
  //   testDeviceIds: testDeviceIds,
  // );
  // MobileAds.instance.updateRequestConfiguration(configuration);
  await Hive.initFlutter();
  await Hive.openBox<int>('visitedExoplanetsBox');
  await Hive.openBox<String>('userIconBox');
  await Hive.openBox<List>('favoriteExoplanetsBox'); // New box for favorites
  await AppColors.loadTheme();

  await initDependencies();

  runApp(const ProviderScope(child: ExoView()));
}

class ExoView extends ConsumerWidget {
  const ExoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      themeMode: themeMode,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.brightPurple,
        scaffoldBackgroundColor: AppColors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.brightPurple,
        scaffoldBackgroundColor: AppColors.dark,
      ),
    );
  }
}
