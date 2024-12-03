import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
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

final filteredExoplanetsProvider = StateProvider<List<Exoplanet>>((ref) {
  return [];
});

@riverpod
RangeValues discoveryYearRange(Ref ref) {
  return RangeValues(1995, 2024);
}

@riverpod
RangeValues orbitalPeriodRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues planetMassRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues planetRadiusRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues planetTempRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues planetDensityRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues transitDurationRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

@riverpod
RangeValues insolationFluxRange(Ref ref) {
  return RangeValues(0, 1000); // Adjust initial values as needed
}

// These two might need different approaches if you still need state management:
@riverpod
bool controversialOriginRange(Ref ref) {
  return false; // Initial value
}

@riverpod
String discoverPlanetMethod(Ref ref) {
  return ''; // Initial value
}
