import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import 'package:myapp/config/theme/colors.dart';

import '../providers/favorites_providers.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getFavoritesWithFallbackUseCaseProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'My Favorites',
          style: AppFonts.spaceGrotesk18.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder<Either<Failure, dynamic>>(
          future: future.call(NoParams()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: AppColors.brightTealGreen,
              ));
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return snapshot.data!.fold(
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
                      return TouchableExoplanetCard(
                        exoplanet: exoplanet,
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: Text('Unexpected error'));
            }
          },
        ),
      ),
    );
  }
}
