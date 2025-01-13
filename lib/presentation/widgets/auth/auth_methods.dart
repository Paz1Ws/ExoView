import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/presentation/screens/auth/providers/auth_providers.dart';
import 'package:myapp/presentation/screens/home/screens/home_view.dart';
import 'package:myapp/presentation/widgets/home/curve_of_exoplanets.dart';

class AuthMethods extends ConsumerWidget {
  const AuthMethods({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthMethodButton(
            methodImage: 'assets/images/auth_icons/google.webp',
            onPressed: () async {
              final result =
                  await ref.read(signInWithGoogleProvider).call(NoParams());
              result.fold(
                (failure) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Failed to sign in with Google: $failure'))),
                (user) => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeView(curveOfExoplanets: CurveOfExoplanets()))),
              );
            },
          ),
          const SizedBox(width: 25),
          Opacity(
            opacity: 0.5,
            child: AuthMethodButton(
              methodImage: 'assets/images/auth_icons/facebook.webp',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'I have it, Facebook Auth will be implemented by your request.')),
                );
              },
            ),
          ),
          const SizedBox(width: 25),
          if (Theme.of(context).platform == TargetPlatform.iOS)
            AuthMethodButton(
              methodImage: 'assets/images/auth_icons/apple.webp',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'I have it, Apple Auth will be implemented by your request.')),
                );
              },
            )
          else
            Opacity(
              opacity: 0.5,
              child: AuthMethodButton(
                methodImage: 'assets/images/auth_icons/apple.webp',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'I have it, Apple Auth will be implemented by your request.')),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class AuthMethodButton extends StatelessWidget {
  final String methodImage;
  final VoidCallback onPressed;
  const AuthMethodButton(
      {super.key, required this.methodImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onPressed,
        child: Image.asset(methodImage, height: 50, width: 80),
      ),
    );
  }
}
