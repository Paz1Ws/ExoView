import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/presentation/screens/favorites/providers/favorites_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import 'package:myapp/config/theme/colors.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsyncValue =
        ref.watch(getLocalFavoritesProvider(NoParams()));

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Favorites',
          style: AppFonts.spaceGrotesk18,

        ),
      ),
      body: favoritesAsyncValue.when(
        data: (either) {
          return either.fold(
            (failure) => Center(
                child: Text('Failed to load favorites',
                    style: AppFonts.spaceGrotesk16)),
            (favorites) {
              if (favorites.isEmpty) {
                return Center(
                    child: Text('No favorites found',
                        style: AppFonts.spaceGrotesk16));
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final exoplanet = favorites[index];
                  return TouchableExoplanetCard(exoplanet: exoplanet);
                },
              );
            },
          );
        },
        loading: () => Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          color: AppColors.brightTealGreen,
        )),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
