import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/fonts.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Favorites',
          style: AppFonts.spaceGrotesk16,
        ),
      ),
      body: Center(
          // child: GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 10,
          //     mainAxisSpacing: 10,
          //   ),
          //   itemCount: ref.watch(favoriteExoplanets).length,
          //   itemBuilder: (context, index) {
          //     final exoplanet = ref.watch(favoriteExoplanets)[index];
          //     return TouchableExoplanetCard(exoplanet: exoplanet);
          //   },
          // ),
          ),
    );
  }
}
