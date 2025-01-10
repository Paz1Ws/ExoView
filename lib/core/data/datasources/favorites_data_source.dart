import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class FavoritesDataSource {
  Future<void> addFavorite(Exoplanet exoplanet);
  Future<void> removeFavorite(String id);
  Future<List<Exoplanet>> getFavorites();
  Future<bool> isFavorite(String id);
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}

class FavoritesRemoteDataSource implements FavoritesDataSource {
  final ExoplanetLocalDataSourceImpl localDataSource;
  final SupabaseClient supabaseClient;
  final Box box;

  Session? get currentUser => supabaseClient.auth.currentSession;

  FavoritesRemoteDataSource(
      this.supabaseClient, this.box, this.localDataSource);

  @override
  Future<void> addFavorite(Exoplanet exoplanet) async {
    try {
      // Retrieve the latest favorites from the remote source
      final remoteFavorites = await getFavorites();

      List<Map<String, dynamic>> favorites =
          remoteFavorites.map((e) => e.toJson()).toList();

      if (favorites.any((favorite) => favorite['id'] == exoplanet.id)) {
        return;
      }

      if (favorites.length >= 15) {
        throw Exception('Cannot have more than 15 favorite exoplanets.');
      }

      favorites.add(exoplanet.toJson());

      await supabaseClient
          .from('users')
          .update({'favorites': favorites})
          .eq('id', currentUser!.user.id)
          .single();

      final localFavoritesResult = await getLocalFavoriteExoplanets();
      localFavoritesResult.fold(
        (failure) => print(failure.message),
        (localFavorites) async {
          if (!localFavorites
              .any((localExoplanet) => localExoplanet.id == exoplanet.id)) {
            localFavorites.add(exoplanet);
            await box.put('favoriteExoplanets',
                localFavorites.map((e) => e.toJson()).toList());
          }
        },
      );
    } catch (e) {
      print('Failed to add favorite: $e');
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      // Retrieve the latest favorites from the remote source
      final remoteFavorites = await getFavorites();

      List<Map<String, dynamic>> favorites =
          remoteFavorites.map((e) => e.toJson()).toList();

      favorites.removeWhere((favorite) => favorite['id'] == int.parse(id));

      await supabaseClient
          .from('users')
          .update({'favorites': favorites})
          .eq('id', currentUser!.user.id)
          .single();

      final localFavoritesResult = await getLocalFavoriteExoplanets();
      localFavoritesResult.fold(
        (failure) => print(failure.message),
        (localFavorites) async {
          localFavorites
              .removeWhere((exoplanet) => exoplanet.id == int.parse(id));
          await box.put('favoriteExoplanets',
              localFavorites.map((e) => e.toJson()).toList());
        },
      );
    } catch (e) {
      print('Failed to remove favorite: $e');
    }
  }

  @override
  Future<List<Exoplanet>> getFavorites() async {
    try {
      final response = await supabaseClient
          .from('users')
          .select('favorites')
          .eq('id', currentUser!.user.id)
          .single();

      List<Map<String, dynamic>> favoriteIds =
          List<Map<String, dynamic>>.from(response['favorites'] ?? []);

      if (favoriteIds.isEmpty) {
        return [];
      }

      return (response['favorites'] as List)
          .map((e) => Exoplanet.fromJson(e, e['id']))
          .toList();
    } catch (e) {
      print('Failed to retrieve from remote: $e');
      final localFavoritesResult = await getLocalFavoriteExoplanets();
      return localFavoritesResult.fold(
        (failure) {
          print(failure.message);
          return [];
        },
        (localFavorites) => localFavorites,
      );
    }
  }

  @override
  Future<bool> isFavorite(String id) async {
    try {
      // Retrieve the latest favorites from the remote source
      final remoteFavorites = await getFavorites();

      return remoteFavorites.any((favorite) => favorite.id == int.parse(id));
    } catch (e) {
      print('Failed to retrieve from remote: $e');
      final localFavoritesResult = await getLocalFavoriteExoplanets();
      return localFavoritesResult.fold(
        (failure) {
          print(failure.message);
          return false;
        },
        (localFavorites) {
          return localFavorites
              .any((exoplanet) => exoplanet.id == int.parse(id));
        },
      );
    }
  }

  Future<Either<Failure, List<Exoplanet>>> addExoplanetFavoritestoLocal(
      Exoplanet exoplanet) async {
    final localFavoritesResult = await getLocalFavoriteExoplanets();

    return localFavoritesResult.fold(
      (failure) => Left(failure),
      (exoplanets) async {
        List<Exoplanet> localFavorites = List.from(exoplanets);
        localFavorites.add(exoplanet);

        await box.put('favoriteExoplanets',
            localFavorites.map((e) => e.toJson()).toList());

        return Right(localFavorites);
      },
    );
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets() async {
    final data = box.get('favoriteExoplanets', defaultValue: []);

    final exoplanets = (data as List).map((e) {
      final map = Map<String, dynamic>.from(e as Map);
      return Exoplanet.fromJson(map, map['id']);
    }).toList();
    return Right(exoplanets);
  }
}
