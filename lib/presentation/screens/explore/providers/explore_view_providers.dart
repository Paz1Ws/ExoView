import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/core/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/providers/exoplanet_providers.dart';

part 'explore_view_providers.g.dart';

final maxYearProv = StateProvider((_) => 1000);
final minYearProv = StateProvider((_) => 0);

@riverpod
Future<Either<Failure, List<Exoplanet>>> getAllExoplanets(Ref ref) async {
  final exoplanets = await ref.watch(exoplanetsProvider);
  return exoplanets;
}

@riverpod
StateProvider<int> maxDiscoverYear(Ref ref, List<Exoplanet> exoplanets) {
  final maxYear = exoplanets
      .reduce((value, element) =>
          value.discoveryYear > element.discoveryYear ? value : element)
      .discoveryYear;
  return StateProvider<int>((ref) => maxYear);
}

@riverpod
StateProvider<int> minDiscoverYear(Ref ref, List<Exoplanet> exoplanets) {
  final minYear = exoplanets
      .reduce((value, element) =>
          value.discoveryYear < element.discoveryYear ? value : element)
      .discoveryYear;
  return StateProvider<int>((ref) => minYear);
}

@riverpod
StateProvider<int> maxPlanetDistance(Ref ref) =>
    StateProvider<int>((ref) => 2024);

@riverpod
StateProvider<int> minPlanetDistance(Ref ref) =>
    StateProvider<int>((ref) => 1990);

@riverpod
StateProvider<int> maxOrbitalPeriod(Ref ref) =>
    StateProvider<int>((ref) => 1000);

@riverpod
StateProvider<int> minOrbitalPeriod(Ref ref) => StateProvider<int>((ref) => 0);

@riverpod
StateProvider<int> maxPlanetMass(Ref ref) => StateProvider<int>((ref) => 1000);

@riverpod
StateProvider<int> minPlanetMass(Ref ref) => StateProvider<int>((ref) => 0);

@riverpod
StateProvider<int> maxPlanetRadius(Ref ref) =>
    StateProvider<int>((ref) => 1000);

@riverpod
StateProvider<int> minPlanetRadius(Ref ref) => StateProvider<int>((ref) => 0);

@riverpod
StateProvider<int> maxPlanetTemp(Ref ref) => StateProvider<int>((ref) => 1000);

@riverpod
StateProvider<int> minPlanetTemp(Ref ref) => StateProvider<int>((ref) => 0);

@riverpod
StateProvider<int> maxPlanetDensity(Ref ref) =>
    StateProvider<int>((ref) => 1000);

@riverpod
StateProvider<int> minPlanetDensity(Ref ref) => StateProvider<int>((ref) => 0);

@riverpod
StateProvider<String> discoverPlanetMethod(Ref ref) =>
    StateProvider<String>((ref) => 'All');
