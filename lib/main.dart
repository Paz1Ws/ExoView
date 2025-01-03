import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/init_dependencies.dart';
import 'presentation/screens/onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(const ProviderScope(child: ExoView()));
}

class ExoView extends StatelessWidget {
  const ExoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      themeMode: ThemeMode.light,
    );
  }
}
