import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class FavoritesDataSource {
  Future<void> addFavorite(String id, String name);
  Future<void> removeFavorite(String id);
  Future<PostgrestMap> getFavorites();
  Future<bool> isFavorite(String id);
  Future<Either<Failure, void>> addExoplanetFavoritestoLocal(
      String id, String name);
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
  Future<void> addFavorite(String id, String name) async {
    final response = await getFavorites();

    List<Map<String, dynamic>> favorites =
        List<Map<String, dynamic>>.from(response['favorites'] ?? []);
    if (!favorites.any((favorite) => favorite['id'] == id)) {
      favorites.add({'id': id, 'name': name});
    }
    await supabaseClient
        .from('users')
        .update({'favorites': favorites})
        .eq('id', currentUser!.user.id)
        .single();
    await addExoplanetFavoritestoLocal(id, name);
  }

  @override
  Future<void> removeFavorite(String id) async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();

    List<Map<String, dynamic>> favorites =
        List<Map<String, dynamic>>.from(response['favorites'] ?? []);
    favorites.removeWhere((favorite) => favorite['id'] == id);
    await supabaseClient
        .from('users')
        .update({'favorites': favorites})
        .eq('id', currentUser!.user.id)
        .single();

    await box.put('favoriteExoplanets', favorites);
  }

  @override
  Future<PostgrestMap> getFavorites() async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();
    return response;
  }

  @override
  Future<bool> isFavorite(String id) async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();

    List<Map<String, String>> favorites =
        List<Map<String, String>>.from(response['favorites'] ?? []);
    return favorites.any((favorite) => favorite['id'] == id);
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>>
      addExoplanetFavoritestoLocal(String id, String name) async {
    final localFavoritesResult = await getLocalFavoriteExoplanets();

    return localFavoritesResult.fold(
      (failure) => Left(failure),
      (exoplanets) async {
        List<Map<String, dynamic>> localFavorites =
            exoplanets.map((e) => e.toJson()).toList();
        localFavorites.add({'id': id, 'name': name});

        await box.put('favoriteExoplanets', localFavorites);

        return Right(localFavorites);
      },
    );
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets() async {
    final List<dynamic> data =
        box.get('favoriteExoplanets', defaultValue: []);

    final localExoplanetsResult = await localDataSource.getLocalExoplanets();

    if (localExoplanetsResult.isLeft()) {
      return Left(localExoplanetsResult.getLeft().toNullable()!);
    }

    final localExoplanets = localExoplanetsResult.getRight().toNullable()!;
    final favoriteExoplanets = localExoplanets
        .where((exoplanet) =>
            data.any((element) => exoplanet.planetName == element['name'].toString()))
        .toList();

    return Right(favoriteExoplanets);
  }
}
