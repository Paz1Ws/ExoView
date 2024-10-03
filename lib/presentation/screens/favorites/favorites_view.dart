import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exoplanetsAsyncValue = ref.watch(exoplanetsProvider);

    return FutureBuilder<Either<Failure, List<Exoplanet>>>(
      future: exoplanetsAsyncValue,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final exoplanets = snapshot.data!;

          return exoplanets.fold(
            (failure) => Center(child: Text('Error: $failure')),
            (exoplanets) => ListView.builder(
              itemCount: exoplanets.length,
              itemBuilder: (context, index) {
                final exoplanet = exoplanets[index];
                return ListTile(
                  trailing: Text(
                    exoplanet.equilibriumTemperature.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  title: Text(
                    exoplanet.planetName,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(exoplanet.discoveryMethod),
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
