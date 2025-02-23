// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesRepositoryHash() =>
    r'e1d7b9d47759b05570b0b07fdf742c899707aa0b';

/// See also [favoritesRepository].
@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider =
    AutoDisposeProvider<FavoritesRepositoryImpl>.internal(
  favoritesRepository,
  name: r'favoritesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoritesRepositoryRef
    = AutoDisposeProviderRef<FavoritesRepositoryImpl>;
String _$addFavoriteUseCaseHash() =>
    r'163cc4c1f161c1edec423fd4b20a0fdb62a79e89';

/// See also [addFavoriteUseCase].
@ProviderFor(addFavoriteUseCase)
final addFavoriteUseCaseProvider = AutoDisposeProvider<AddFavorite>.internal(
  addFavoriteUseCase,
  name: r'addFavoriteUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addFavoriteUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddFavoriteUseCaseRef = AutoDisposeProviderRef<AddFavorite>;
String _$addFavoritesToLocalHash() =>
    r'5aa988a4de9c7cbe09fe3f9976629b1ff9be811e';

/// See also [addFavoritesToLocal].
@ProviderFor(addFavoritesToLocal)
final addFavoritesToLocalProvider =
    AutoDisposeProvider<AddFavoritesToLocal>.internal(
  addFavoritesToLocal,
  name: r'addFavoritesToLocalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addFavoritesToLocalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddFavoritesToLocalRef = AutoDisposeProviderRef<AddFavoritesToLocal>;
String _$removeFavoriteUseCaseHash() =>
    r'63546bb28c16165fe774cb8d7bdfefab11692ceb';

/// See also [removeFavoriteUseCase].
@ProviderFor(removeFavoriteUseCase)
final removeFavoriteUseCaseProvider =
    AutoDisposeProvider<RemoveFavorite>.internal(
  removeFavoriteUseCase,
  name: r'removeFavoriteUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$removeFavoriteUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RemoveFavoriteUseCaseRef = AutoDisposeProviderRef<RemoveFavorite>;
String _$isFavoriteUseCaseHash() => r'c814d1a344595e9656e1ac747599d940f682c811';

/// See also [isFavoriteUseCase].
@ProviderFor(isFavoriteUseCase)
final isFavoriteUseCaseProvider = AutoDisposeProvider<IsFavorite>.internal(
  isFavoriteUseCase,
  name: r'isFavoriteUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isFavoriteUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsFavoriteUseCaseRef = AutoDisposeProviderRef<IsFavorite>;
String _$getLocalFavoritesUseCaseHash() =>
    r'77e82c3aa6d76418a0001b4af53426b38dcc9012';

/// See also [getLocalFavoritesUseCase].
@ProviderFor(getLocalFavoritesUseCase)
final getLocalFavoritesUseCaseProvider =
    AutoDisposeProvider<GetLocalFavorites>.internal(
  getLocalFavoritesUseCase,
  name: r'getLocalFavoritesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getLocalFavoritesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetLocalFavoritesUseCaseRef = AutoDisposeProviderRef<GetLocalFavorites>;
String _$getFavoritesWithFallbackUseCaseHash() =>
    r'19b1b5af1493eba78817183b138c1ac13de44dea';

/// See also [getFavoritesWithFallbackUseCase].
@ProviderFor(getFavoritesWithFallbackUseCase)
final getFavoritesWithFallbackUseCaseProvider =
    AutoDisposeProvider<GetFavoritesWithFallback>.internal(
  getFavoritesWithFallbackUseCase,
  name: r'getFavoritesWithFallbackUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFavoritesWithFallbackUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFavoritesWithFallbackUseCaseRef
    = AutoDisposeProviderRef<GetFavoritesWithFallback>;
String _$syncFavoritesUseCaseHash() =>
    r'70a9c0f33c4052a5356b838a8f75b9b591e9b793';

/// See also [syncFavoritesUseCase].
@ProviderFor(syncFavoritesUseCase)
final syncFavoritesUseCaseProvider =
    AutoDisposeProvider<SyncFavorites>.internal(
  syncFavoritesUseCase,
  name: r'syncFavoritesUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncFavoritesUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SyncFavoritesUseCaseRef = AutoDisposeProviderRef<SyncFavorites>;
String _$addFavoriteHash() => r'094a2ad93949b067856cddacf899e6996eb3852d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [addFavorite].
@ProviderFor(addFavorite)
const addFavoriteProvider = AddFavoriteFamily();

/// See also [addFavorite].
class AddFavoriteFamily extends Family<AsyncValue<Either<Failure, void>>> {
  /// See also [addFavorite].
  const AddFavoriteFamily();

  /// See also [addFavorite].
  AddFavoriteProvider call(
    AddFavoriteParams params,
  ) {
    return AddFavoriteProvider(
      params,
    );
  }

  @override
  AddFavoriteProvider getProviderOverride(
    covariant AddFavoriteProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addFavoriteProvider';
}

/// See also [addFavorite].
class AddFavoriteProvider
    extends AutoDisposeFutureProvider<Either<Failure, void>> {
  /// See also [addFavorite].
  AddFavoriteProvider(
    AddFavoriteParams params,
  ) : this._internal(
          (ref) => addFavorite(
            ref as AddFavoriteRef,
            params,
          ),
          from: addFavoriteProvider,
          name: r'addFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addFavoriteHash,
          dependencies: AddFavoriteFamily._dependencies,
          allTransitiveDependencies:
              AddFavoriteFamily._allTransitiveDependencies,
          params: params,
        );

  AddFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final AddFavoriteParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, void>> Function(AddFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddFavoriteProvider._internal(
        (ref) => create(ref as AddFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, void>> createElement() {
    return _AddFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddFavoriteProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddFavoriteRef on AutoDisposeFutureProviderRef<Either<Failure, void>> {
  /// The parameter `params` of this provider.
  AddFavoriteParams get params;
}

class _AddFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, void>>
    with AddFavoriteRef {
  _AddFavoriteProviderElement(super.provider);

  @override
  AddFavoriteParams get params => (origin as AddFavoriteProvider).params;
}

String _$saveFavoritesLocallyHash() =>
    r'14aed78d40f710fcdf7a977a857c89049725a9f9';

/// See also [saveFavoritesLocally].
@ProviderFor(saveFavoritesLocally)
const saveFavoritesLocallyProvider = SaveFavoritesLocallyFamily();

/// See also [saveFavoritesLocally].
class SaveFavoritesLocallyFamily
    extends Family<AsyncValue<Either<Failure, void>>> {
  /// See also [saveFavoritesLocally].
  const SaveFavoritesLocallyFamily();

  /// See also [saveFavoritesLocally].
  SaveFavoritesLocallyProvider call(
    AddFavoriteParams params,
  ) {
    return SaveFavoritesLocallyProvider(
      params,
    );
  }

  @override
  SaveFavoritesLocallyProvider getProviderOverride(
    covariant SaveFavoritesLocallyProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveFavoritesLocallyProvider';
}

/// See also [saveFavoritesLocally].
class SaveFavoritesLocallyProvider
    extends AutoDisposeFutureProvider<Either<Failure, void>> {
  /// See also [saveFavoritesLocally].
  SaveFavoritesLocallyProvider(
    AddFavoriteParams params,
  ) : this._internal(
          (ref) => saveFavoritesLocally(
            ref as SaveFavoritesLocallyRef,
            params,
          ),
          from: saveFavoritesLocallyProvider,
          name: r'saveFavoritesLocallyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveFavoritesLocallyHash,
          dependencies: SaveFavoritesLocallyFamily._dependencies,
          allTransitiveDependencies:
              SaveFavoritesLocallyFamily._allTransitiveDependencies,
          params: params,
        );

  SaveFavoritesLocallyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final AddFavoriteParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, void>> Function(SaveFavoritesLocallyRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveFavoritesLocallyProvider._internal(
        (ref) => create(ref as SaveFavoritesLocallyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, void>> createElement() {
    return _SaveFavoritesLocallyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFavoritesLocallyProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveFavoritesLocallyRef
    on AutoDisposeFutureProviderRef<Either<Failure, void>> {
  /// The parameter `params` of this provider.
  AddFavoriteParams get params;
}

class _SaveFavoritesLocallyProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, void>>
    with SaveFavoritesLocallyRef {
  _SaveFavoritesLocallyProviderElement(super.provider);

  @override
  AddFavoriteParams get params =>
      (origin as SaveFavoritesLocallyProvider).params;
}

String _$removeFavoriteHash() => r'e727b4d52b58d8cb2214787f5180fb2544052748';

/// See also [removeFavorite].
@ProviderFor(removeFavorite)
const removeFavoriteProvider = RemoveFavoriteFamily();

/// See also [removeFavorite].
class RemoveFavoriteFamily extends Family<AsyncValue<Either<Failure, void>>> {
  /// See also [removeFavorite].
  const RemoveFavoriteFamily();

  /// See also [removeFavorite].
  RemoveFavoriteProvider call(
    RemoveFavoriteParams params,
  ) {
    return RemoveFavoriteProvider(
      params,
    );
  }

  @override
  RemoveFavoriteProvider getProviderOverride(
    covariant RemoveFavoriteProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeFavoriteProvider';
}

/// See also [removeFavorite].
class RemoveFavoriteProvider
    extends AutoDisposeFutureProvider<Either<Failure, void>> {
  /// See also [removeFavorite].
  RemoveFavoriteProvider(
    RemoveFavoriteParams params,
  ) : this._internal(
          (ref) => removeFavorite(
            ref as RemoveFavoriteRef,
            params,
          ),
          from: removeFavoriteProvider,
          name: r'removeFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeFavoriteHash,
          dependencies: RemoveFavoriteFamily._dependencies,
          allTransitiveDependencies:
              RemoveFavoriteFamily._allTransitiveDependencies,
          params: params,
        );

  RemoveFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final RemoveFavoriteParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, void>> Function(RemoveFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveFavoriteProvider._internal(
        (ref) => create(ref as RemoveFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, void>> createElement() {
    return _RemoveFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveFavoriteProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveFavoriteRef on AutoDisposeFutureProviderRef<Either<Failure, void>> {
  /// The parameter `params` of this provider.
  RemoveFavoriteParams get params;
}

class _RemoveFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, void>>
    with RemoveFavoriteRef {
  _RemoveFavoriteProviderElement(super.provider);

  @override
  RemoveFavoriteParams get params => (origin as RemoveFavoriteProvider).params;
}

String _$isFavoriteHash() => r'0d13c6ccc339ec4f67da6972c56698641a9c4049';

/// See also [isFavorite].
@ProviderFor(isFavorite)
const isFavoriteProvider = IsFavoriteFamily();

/// See also [isFavorite].
class IsFavoriteFamily extends Family<AsyncValue<Either<Failure, bool>>> {
  /// See also [isFavorite].
  const IsFavoriteFamily();

  /// See also [isFavorite].
  IsFavoriteProvider call(
    IsFavoriteParams params,
  ) {
    return IsFavoriteProvider(
      params,
    );
  }

  @override
  IsFavoriteProvider getProviderOverride(
    covariant IsFavoriteProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isFavoriteProvider';
}

/// See also [isFavorite].
class IsFavoriteProvider
    extends AutoDisposeFutureProvider<Either<Failure, bool>> {
  /// See also [isFavorite].
  IsFavoriteProvider(
    IsFavoriteParams params,
  ) : this._internal(
          (ref) => isFavorite(
            ref as IsFavoriteRef,
            params,
          ),
          from: isFavoriteProvider,
          name: r'isFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoriteHash,
          dependencies: IsFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsFavoriteFamily._allTransitiveDependencies,
          params: params,
        );

  IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final IsFavoriteParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, bool>> Function(IsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoriteProvider._internal(
        (ref) => create(ref as IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, bool>> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFavoriteRef on AutoDisposeFutureProviderRef<Either<Failure, bool>> {
  /// The parameter `params` of this provider.
  IsFavoriteParams get params;
}

class _IsFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, bool>>
    with IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  IsFavoriteParams get params => (origin as IsFavoriteProvider).params;
}

String _$getLocalFavoritesHash() => r'2d1c785c949f8d28ddfe80e0e4467eb59d6d82c6';

/// See also [getLocalFavorites].
@ProviderFor(getLocalFavorites)
const getLocalFavoritesProvider = GetLocalFavoritesFamily();

/// See also [getLocalFavorites].
class GetLocalFavoritesFamily
    extends Family<AsyncValue<Either<Failure, List<Exoplanet>>>> {
  /// See also [getLocalFavorites].
  const GetLocalFavoritesFamily();

  /// See also [getLocalFavorites].
  GetLocalFavoritesProvider call(
    NoParams params,
  ) {
    return GetLocalFavoritesProvider(
      params,
    );
  }

  @override
  GetLocalFavoritesProvider getProviderOverride(
    covariant GetLocalFavoritesProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getLocalFavoritesProvider';
}

/// See also [getLocalFavorites].
class GetLocalFavoritesProvider
    extends AutoDisposeFutureProvider<Either<Failure, List<Exoplanet>>> {
  /// See also [getLocalFavorites].
  GetLocalFavoritesProvider(
    NoParams params,
  ) : this._internal(
          (ref) => getLocalFavorites(
            ref as GetLocalFavoritesRef,
            params,
          ),
          from: getLocalFavoritesProvider,
          name: r'getLocalFavoritesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLocalFavoritesHash,
          dependencies: GetLocalFavoritesFamily._dependencies,
          allTransitiveDependencies:
              GetLocalFavoritesFamily._allTransitiveDependencies,
          params: params,
        );

  GetLocalFavoritesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final NoParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, List<Exoplanet>>> Function(
            GetLocalFavoritesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLocalFavoritesProvider._internal(
        (ref) => create(ref as GetLocalFavoritesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, List<Exoplanet>>>
      createElement() {
    return _GetLocalFavoritesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLocalFavoritesProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLocalFavoritesRef
    on AutoDisposeFutureProviderRef<Either<Failure, List<Exoplanet>>> {
  /// The parameter `params` of this provider.
  NoParams get params;
}

class _GetLocalFavoritesProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, List<Exoplanet>>>
    with GetLocalFavoritesRef {
  _GetLocalFavoritesProviderElement(super.provider);

  @override
  NoParams get params => (origin as GetLocalFavoritesProvider).params;
}

String _$getFavoritesWithFallbackHash() =>
    r'8cc2d51745f538d9d782e2e380bfea22d61646ca';

/// See also [getFavoritesWithFallback].
@ProviderFor(getFavoritesWithFallback)
const getFavoritesWithFallbackProvider = GetFavoritesWithFallbackFamily();

/// See also [getFavoritesWithFallback].
class GetFavoritesWithFallbackFamily
    extends Family<AsyncValue<Either<Failure, List<Exoplanet>>>> {
  /// See also [getFavoritesWithFallback].
  const GetFavoritesWithFallbackFamily();

  /// See also [getFavoritesWithFallback].
  GetFavoritesWithFallbackProvider call(
    NoParams params,
  ) {
    return GetFavoritesWithFallbackProvider(
      params,
    );
  }

  @override
  GetFavoritesWithFallbackProvider getProviderOverride(
    covariant GetFavoritesWithFallbackProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getFavoritesWithFallbackProvider';
}

/// See also [getFavoritesWithFallback].
class GetFavoritesWithFallbackProvider
    extends AutoDisposeFutureProvider<Either<Failure, List<Exoplanet>>> {
  /// See also [getFavoritesWithFallback].
  GetFavoritesWithFallbackProvider(
    NoParams params,
  ) : this._internal(
          (ref) => getFavoritesWithFallback(
            ref as GetFavoritesWithFallbackRef,
            params,
          ),
          from: getFavoritesWithFallbackProvider,
          name: r'getFavoritesWithFallbackProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFavoritesWithFallbackHash,
          dependencies: GetFavoritesWithFallbackFamily._dependencies,
          allTransitiveDependencies:
              GetFavoritesWithFallbackFamily._allTransitiveDependencies,
          params: params,
        );

  GetFavoritesWithFallbackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final NoParams params;

  @override
  Override overrideWith(
    FutureOr<Either<Failure, List<Exoplanet>>> Function(
            GetFavoritesWithFallbackRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFavoritesWithFallbackProvider._internal(
        (ref) => create(ref as GetFavoritesWithFallbackRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Either<Failure, List<Exoplanet>>>
      createElement() {
    return _GetFavoritesWithFallbackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFavoritesWithFallbackProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFavoritesWithFallbackRef
    on AutoDisposeFutureProviderRef<Either<Failure, List<Exoplanet>>> {
  /// The parameter `params` of this provider.
  NoParams get params;
}

class _GetFavoritesWithFallbackProviderElement
    extends AutoDisposeFutureProviderElement<Either<Failure, List<Exoplanet>>>
    with GetFavoritesWithFallbackRef {
  _GetFavoritesWithFallbackProviderElement(super.provider);

  @override
  NoParams get params => (origin as GetFavoritesWithFallbackProvider).params;
}

String _$syncFavoritesHash() => r'49486b7df1c4f4cbd39983d5ed1ec3554191d7f2';

/// See also [syncFavorites].
@ProviderFor(syncFavorites)
final syncFavoritesProvider =
    AutoDisposeFutureProvider<Either<Failure, void>>.internal(
  syncFavorites,
  name: r'syncFavoritesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$syncFavoritesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SyncFavoritesRef = AutoDisposeFutureProviderRef<Either<Failure, void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
