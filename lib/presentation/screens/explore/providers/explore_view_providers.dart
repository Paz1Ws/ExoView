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

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> discoveryYearRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> orbitalPeriodRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> planetMassRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> planetRadiusRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> planetTempRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> planetDensityRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> transitDurationRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<RangeValuesNotifier, RangeValues> insolationFluxRange(
        Ref ref) =>
    StateNotifierProvider<RangeValuesNotifier, RangeValues>(
        (ref) => RangeValuesNotifier());

@riverpod
StateNotifierProvider<BoolNotifier, bool> controversialOriginRange(Ref ref) =>
    StateNotifierProvider<BoolNotifier, bool>((ref) => BoolNotifier());

@riverpod
StateNotifierProvider<StringNotifier, String> discoverPlanetMethod(Ref ref) =>
    StateNotifierProvider<StringNotifier, String>((ref) => StringNotifier());
