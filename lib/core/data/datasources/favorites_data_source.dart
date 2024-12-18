import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class FavoritesDataSource {
  Future<void> addFavorite(String id, String name);
  Future<void> removeFavorite(String id);
  Future<List<Exoplanet>> getFavorites();
  Future<bool> isFavorite(String id);
  Future<Either<Failure, void>> addExoplanetFavoritestoLocal(
      String id, String name);
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}

class FavoritesRemoteDataSource implements FavoritesDataSource {
  final SupabaseClient supabaseClient;
  final Box box;

  Session? get currentUser => supabaseClient.auth.currentSession;

  FavoritesRemoteDataSource(this.supabaseClient, this.box);

  @override
  Future<void> addFavorite(String id, String name) async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();

    List<Map<String, dynamic>> favorites =
        List<Map<String, dynamic>>.from(response['favorites'] ?? []);
    if (!favorites.any((favorite) => favorite['id'] == id)) {
      favorites.add({'id': id, 'name': name});
    }

    await box.put('favorites', favorites);
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

    await box.put('favorites', favorites);
  }

  @override
  Future<List<Exoplanet>> getFavorites() async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();

    List<Map<String, String>> favoriteIds =
        List<Map<String, String>>.from(response['favorites'] ?? []);

    if (favoriteIds.isEmpty) {
      return [];
    }

    final exoplanetsResponse = await supabaseClient
        .from('exoplanets')
        .select()
        .eq('id', favoriteIds.map((favorite) => favorite['id']).toList());

    final List<dynamic> exoplanetsData = exoplanetsResponse;
    return exoplanetsData.map((e) => Exoplanet.fromJson(e, e['id'])).toList();
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
  Future<Either<Failure, void>> addExoplanetFavoritestoLocal(
      String id, String name) async {
    final response = await supabaseClient
        .from('users')
        .select('favorites')
        .eq('id', currentUser!.user.id)
        .single();

    List<Map<String, dynamic>> favoriteIds =
        List<Map<String, dynamic>>.from(response['favorites'] ?? []);

    if (favoriteIds.isEmpty) {
      return Right([]);
    }

    await box.put('favoriteExoplanets', favoriteIds);

    return Right(favoriteIds);
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets() async {
    final List<dynamic> data = box.get('favoriteExoplanets', defaultValue: []);

    final favoriteExoplanets = data
        .map((e) =>
            Exoplanet.fromJson(Map<String, String>.from(e), int.parse(e['id'])))
        .toList();
    return Right(favoriteExoplanets);
  }
}
