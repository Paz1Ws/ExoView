import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:myapp/core/data/models/exoplanet_model.dart';
import 'package:myapp/core/domain/repositories/favorites_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:myapp/config/failures/failures.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final SupabaseClient supabaseClient;
  final Box box;

  FavoritesRepositoryImpl(this.supabaseClient, this.box);
  @override
  Future<Either<Failure, List<Exoplanet>>> getFavoriteExoplanets() async {
    final response = await supabaseClient.from('favorites').select();

    try {
      final List<dynamic> data = response;
      final favoriteExoplanets =
          data.map((e) => Exoplanet.fromJson(e)).toList();

      // Store in Hive
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
