import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/config/config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class FavoritesDataSource {
  Future<void> addFavorite(String id);
  Future<void> removeFavorite(String id);
  Future<List<Exoplanet>> getFavorites();
  Future<bool> isFavorite(String id);
  Future<Either<Failure, List<Exoplanet>>> putFavoriteExoplanets();
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}

class FavoritesRemoteDataSource implements FavoritesDataSource {
  final SupabaseClient supabaseClient;
  final Box box;

  Session? get currentUser => supabaseClient.auth.currentSession;

  FavoritesRemoteDataSource(this.supabaseClient, this.box);

  @override
  Future<void> addFavorite(String id) async {
    final response = await supabaseClient.from('favorites').insert({
      'user_id': currentUser!.user.id,
      'exoplanet_id': id,
    });

    if (response.error != null) {
      throw Exception('Failed to add favorite: ${response.error!.message}');
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    final response = await supabaseClient
        .from('favorites')
        .delete()
        .eq('user_id', currentUser!.user.id)
        .eq('exoplanet_id', id);

    if (response.error != null) {
      throw Exception('Failed to remove favorite: ${response.error!.message}');
    }
  }

  @override
  Future<List<Exoplanet>> getFavorites() async {
    final response = await supabaseClient
        .from('favorites')
        .select('exoplanet_id')
        .eq('user_id', currentUser!.user.id);

    final List<dynamic> data = response;
    final List<String> favoriteIds =
        data.map((e) => e['exoplanet_id'] as String).toList();

    final exoplanetsResponse =
        await supabaseClient.from('exoplanets').select().eq('id', favoriteIds);

    final List<dynamic> exoplanetsData = exoplanetsResponse;
    return exoplanetsData.map((e) => Exoplanet.fromJson(e)).toList();
  }

  @override
  Future<bool> isFavorite(String id) async {
    final response = await supabaseClient
        .from('favorites')
        .select()
        .eq('user_id', currentUser!.user.id)
        .eq('exoplanet_id', id);

    return response.isNotEmpty;
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> putFavoriteExoplanets() async {
    final response = await supabaseClient.from('favorites').select();

    try {
      final List<dynamic> data = response;
      final favoriteExoplanets =
          data.map((e) => Exoplanet.fromJson(e)).toList();

      await box.put('favoriteExoplanets',
          favoriteExoplanets.map((e) => e.toJson()).toList());

      return Right(favoriteExoplanets);
    } catch (e) {
      return Left(Failure('Failed to fetch favorites: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets() async {
    final List<dynamic> data = box.get('favoriteExoplanets', defaultValue: []);
    final favoriteExoplanets = data
        .map((e) => Exoplanet.fromJson(Map<String, dynamic>.from(e)))
        .toList();
    return Right(favoriteExoplanets);
  }
}
