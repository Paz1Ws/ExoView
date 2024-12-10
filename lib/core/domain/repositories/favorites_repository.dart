import 'package:myapp/core/data/data.dart';
import 'package:myapp/core/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';

import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/config.dart';
import 'package:myapp/core/data/data.dart';

abstract interface class FavoritesRepository {
  Future<Either<Failure, List<Exoplanet>>> getFavoriteExoplanets();
  Future<Either<Failure, List<Exoplanet>>> getLocalFavoriteExoplanets();
}
