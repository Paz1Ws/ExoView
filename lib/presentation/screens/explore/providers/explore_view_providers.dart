import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/util/filter_cases.dart';
import 'package:myapp/core/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/providers/exoplanet_providers.dart';

import 'package:flutter/material.dart';
part 'explore_view_providers.g.dart';

@riverpod
Future<Either<Failure, List<Exoplanet>>> getAllExoplanets(Ref ref) async {
  final localDataSource = ref.read(exoplanetLocalDataSourceProvider);
  await localDataSource.getRemoteExoplanets();
  return await localDataSource.getLocalExoplanets();
}

class RangeValuesNotifier extends StateNotifier<RangeValues> {
  RangeValuesNotifier() : super(RangeValues(0, 1000));

  void setRangeValues(RangeValues values) {
    state = values;
  }
}

class StringNotifier extends StateNotifier<String> {
  StringNotifier() : super('All');

  void setString(String value) {
    state = value;
  }
}

class BoolNotifier extends StateNotifier<bool> {
  BoolNotifier() : super(false);

  void setBool(bool value) {
    state = value;
  }
}

final filteredExoplanets = StateProvider<List<Exoplanet>>((ref) {
  return [];
});

@riverpod
RangeValues discoveryYearRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getDiscoveryYearRange(exoplanets);
}

@riverpod
RangeValues orbitalPeriodRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getOrbitalPeriodRange(exoplanets);
}

@riverpod
RangeValues planetMassRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getPlanetMassRange(exoplanets);
}

@riverpod
RangeValues planetRadiusRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getPlanetRadiusRange(exoplanets);
}

@riverpod
RangeValues planetTempRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getPlanetTempRange(exoplanets);
}

@riverpod
RangeValues planetDensityRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getPlanetDensityRange(exoplanets);
}

@riverpod
RangeValues transitDurationRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getTransitDurationRange(exoplanets);
}

@riverpod
RangeValues insolationFluxRange(Ref ref) {
  List<Exoplanet> exoplanets = ref.watch(localExoplanetsProvider).maybeWhen(
        data: (data) => data.fold((l) => [], (r) => r),
        orElse: () => [],
      );
  return getInsolationFluxRange(exoplanets);
}

@riverpod
bool controversialOriginRange(Ref ref) {
  return false; // Initial value
}

@riverpod
String discoverPlanetMethod(Ref ref) {
  return ''; // Initial value
}
