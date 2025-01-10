import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/util/filter_cases.dart';
import 'package:myapp/core/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../home/providers/exoplanet_providers.dart';

import 'package:flutter/material.dart';
part 'explore_view_providers.g.dart';

void initializeHive() async {
  await Hive.initFlutter();
  await Hive.openBox<int>('visitedExoplanetsBox');
}

class VisitedExoplanetsNotifier extends StateNotifier<int> {
  VisitedExoplanetsNotifier() : super(0) {
    _loadVisitedExoplanetsCount();
  }

  void _loadVisitedExoplanetsCount() {
    final box = Hive.box<int>('visitedExoplanetsBox');
    state = box.get('count', defaultValue: 0) ?? 0;
  }

  void increment() {
    state++;
    final box = Hive.box<int>('visitedExoplanetsBox');
    box.put('count', state);
  }
}

@riverpod
Future<Either<Failure, List<Exoplanet>>> getAllExoplanets(Ref ref) async {
  final localDataSource = ref.read(exoplanetLocalDataSourceProvider);
  try {
    final exoplanets = await localDataSource.getLocalExoplanets();

    return exoplanets;
  } catch (e) {
    final remoteResult = await localDataSource.getRemoteExoplanets();
    if (remoteResult.isRight()) {
      return remoteResult;
    }

    return Left(Failure('Failed to get exoplanets'));
  }
}

@riverpod
Future<void> loadCachedExoplanets(Ref ref) async {
  final localDataSource = ref.read(exoplanetLocalDataSourceProvider);
  final exoplanets = await localDataSource.getLocalExoplanets();
  exoplanets.fold(
    (failure) => ref.read(cachedExoplanetsProvider.notifier).state = [],
    (data) => ref.read(cachedExoplanetsProvider.notifier).state = data,
  );
}

final cachedExoplanetsProvider = StateProvider<List<Exoplanet>>((ref) {
  return [];
});

final filteredExoplanetsProvider = StateProvider<List<dynamic>>((ref) {
  return [];
});

final isFilteringProvider = StateProvider<bool>((ref) {
  return false;
});

final canExitProvider = StateProvider<bool>((ref) {
  return true;
});

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

final visitedExoplanetsProvider =
    StateNotifierProvider<VisitedExoplanetsNotifier, int>((ref) {
  return VisitedExoplanetsNotifier();
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
String typeOfExoplanet(Ref ref) {
  return ''; // Initial value
}
