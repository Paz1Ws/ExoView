import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/init_dependencies.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/screens/onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<int>('visitedExoplanetsBox');
  await initDependencies();

  runApp(const ProviderScope(child: ExoView()));
}

class ExoView extends ConsumerWidget {
  const ExoView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        themeMode: ref.watch(themeProvider));
  }
}
