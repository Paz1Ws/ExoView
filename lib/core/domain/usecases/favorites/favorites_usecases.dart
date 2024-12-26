import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/usecase/usecase.dart';
import 'package:myapp/core/data/data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddFavorite implements UseCase<void, AddFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  AddFavorite(this.repository);

  @override
  Future<Either<Failure, void>> call(AddFavoriteParams params) async {
    final result = await repository.addFavorite(params.exoplanet);
    return result.fold(
      (failure) => Left(failure),
      (success) async {
        final localResult =
            await repository.addFavoriteExoplanetstoLocal(params.exoplanet);
        return localResult.fold(
          (localFailure) => Left(localFailure),
          (localSuccess) => Right(localSuccess),
        );
      },
    );
  }
}

class AddFavoriteParams {
  final Exoplanet exoplanet;

  AddFavoriteParams({required this.exoplanet});
}

class AddFavoritesToLocal implements UseCase<void, AddFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  AddFavoritesToLocal(this.repository);

  @override
  Future<Either<Failure, void>> call(AddFavoriteParams params) async {
    return await repository.addFavoriteExoplanetstoLocal(params.exoplanet);
  }
}

class RemoveFavorite implements UseCase<void, RemoveFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  RemoveFavorite(this.repository);

  @override
  Future<Either<Failure, void>> call(RemoveFavoriteParams params) async {
    return await repository.removeFavorite(params.id);
  }
}

class RemoveFavoriteParams {
  final String id;

  RemoveFavoriteParams({required this.id});
}

class IsFavorite implements UseCase<bool, IsFavoriteParams> {
  final FavoritesRepositoryImpl repository;

  IsFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(IsFavoriteParams params) async {
    return await repository.isFavorite(params.id);
  }
}

class IsFavoriteParams {
  final String id;

  IsFavoriteParams({required this.id});
}

class GetLocalFavorites implements UseCase<List<Exoplanet>, NoParams> {
  final FavoritesRepositoryImpl repository;

  GetLocalFavorites(this.repository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    return await repository.getLocalFavoriteExoplanets();
  }
}

class GetFavoritesWithFallback implements UseCase<List<Exoplanet>, NoParams> {
  final FavoritesRepositoryImpl repository;

  GetFavoritesWithFallback(this.repository);

  @override
  Future<Either<Failure, List<Exoplanet>>> call(NoParams params) async {
    final localResult = await repository.getLocalFavoriteExoplanets();
    return localResult.fold(
      (failure) async {
        final remoteResult = await repository.getFavorites();
        return remoteResult;
      },
      (localFavorites) => Right(localFavorites),
    );
  }
}
