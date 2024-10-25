// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_view_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllExoplanetsHash() => r'0f1e7680fedd12c669bd16cd8611ed7fc188091a';

/// See also [getAllExoplanets].
@ProviderFor(getAllExoplanets)
final getAllExoplanetsProvider =
    AutoDisposeFutureProvider<Either<Failure, List<Exoplanet>>>.internal(
  getAllExoplanets,
  name: r'getAllExoplanetsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllExoplanetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllExoplanetsRef
    = AutoDisposeFutureProviderRef<Either<Failure, List<Exoplanet>>>;
String _$maxDiscoverYearHash() => r'8aa0c40e102d45d01feb7eda7f1b875a27f2e9f5';

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

/// See also [maxDiscoverYear].
@ProviderFor(maxDiscoverYear)
const maxDiscoverYearProvider = MaxDiscoverYearFamily();

/// See also [maxDiscoverYear].
class MaxDiscoverYearFamily extends Family<StateProvider<int>> {
  /// See also [maxDiscoverYear].
  const MaxDiscoverYearFamily();

  /// See also [maxDiscoverYear].
  MaxDiscoverYearProvider call(
    List<Exoplanet> exoplanets,
  ) {
    return MaxDiscoverYearProvider(
      exoplanets,
    );
  }

  @override
  MaxDiscoverYearProvider getProviderOverride(
    covariant MaxDiscoverYearProvider provider,
  ) {
    return call(
      provider.exoplanets,
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
  String? get name => r'maxDiscoverYearProvider';
}

/// See also [maxDiscoverYear].
class MaxDiscoverYearProvider extends AutoDisposeProvider<StateProvider<int>> {
  /// See also [maxDiscoverYear].
  MaxDiscoverYearProvider(
    List<Exoplanet> exoplanets,
  ) : this._internal(
          (ref) => maxDiscoverYear(
            ref as MaxDiscoverYearRef,
            exoplanets,
          ),
          from: maxDiscoverYearProvider,
          name: r'maxDiscoverYearProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$maxDiscoverYearHash,
          dependencies: MaxDiscoverYearFamily._dependencies,
          allTransitiveDependencies:
              MaxDiscoverYearFamily._allTransitiveDependencies,
          exoplanets: exoplanets,
        );

  MaxDiscoverYearProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exoplanets,
  }) : super.internal();

  final List<Exoplanet> exoplanets;

  @override
  Override overrideWith(
    StateProvider<int> Function(MaxDiscoverYearRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MaxDiscoverYearProvider._internal(
        (ref) => create(ref as MaxDiscoverYearRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exoplanets: exoplanets,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<StateProvider<int>> createElement() {
    return _MaxDiscoverYearProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MaxDiscoverYearProvider && other.exoplanets == exoplanets;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exoplanets.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MaxDiscoverYearRef on AutoDisposeProviderRef<StateProvider<int>> {
  /// The parameter `exoplanets` of this provider.
  List<Exoplanet> get exoplanets;
}

class _MaxDiscoverYearProviderElement
    extends AutoDisposeProviderElement<StateProvider<int>>
    with MaxDiscoverYearRef {
  _MaxDiscoverYearProviderElement(super.provider);

  @override
  List<Exoplanet> get exoplanets =>
      (origin as MaxDiscoverYearProvider).exoplanets;
}

String _$minDiscoverYearHash() => r'b58d49761308d3b43615b08158c32d4c2604d2a1';

/// See also [minDiscoverYear].
@ProviderFor(minDiscoverYear)
const minDiscoverYearProvider = MinDiscoverYearFamily();

/// See also [minDiscoverYear].
class MinDiscoverYearFamily extends Family<StateProvider<int>> {
  /// See also [minDiscoverYear].
  const MinDiscoverYearFamily();

  /// See also [minDiscoverYear].
  MinDiscoverYearProvider call(
    List<Exoplanet> exoplanets,
  ) {
    return MinDiscoverYearProvider(
      exoplanets,
    );
  }

  @override
  MinDiscoverYearProvider getProviderOverride(
    covariant MinDiscoverYearProvider provider,
  ) {
    return call(
      provider.exoplanets,
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
  String? get name => r'minDiscoverYearProvider';
}

/// See also [minDiscoverYear].
class MinDiscoverYearProvider extends AutoDisposeProvider<StateProvider<int>> {
  /// See also [minDiscoverYear].
  MinDiscoverYearProvider(
    List<Exoplanet> exoplanets,
  ) : this._internal(
          (ref) => minDiscoverYear(
            ref as MinDiscoverYearRef,
            exoplanets,
          ),
          from: minDiscoverYearProvider,
          name: r'minDiscoverYearProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$minDiscoverYearHash,
          dependencies: MinDiscoverYearFamily._dependencies,
          allTransitiveDependencies:
              MinDiscoverYearFamily._allTransitiveDependencies,
          exoplanets: exoplanets,
        );

  MinDiscoverYearProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exoplanets,
  }) : super.internal();

  final List<Exoplanet> exoplanets;

  @override
  Override overrideWith(
    StateProvider<int> Function(MinDiscoverYearRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MinDiscoverYearProvider._internal(
        (ref) => create(ref as MinDiscoverYearRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exoplanets: exoplanets,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<StateProvider<int>> createElement() {
    return _MinDiscoverYearProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MinDiscoverYearProvider && other.exoplanets == exoplanets;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exoplanets.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MinDiscoverYearRef on AutoDisposeProviderRef<StateProvider<int>> {
  /// The parameter `exoplanets` of this provider.
  List<Exoplanet> get exoplanets;
}

class _MinDiscoverYearProviderElement
    extends AutoDisposeProviderElement<StateProvider<int>>
    with MinDiscoverYearRef {
  _MinDiscoverYearProviderElement(super.provider);

  @override
  List<Exoplanet> get exoplanets =>
      (origin as MinDiscoverYearProvider).exoplanets;
}

String _$maxPlanetDistanceHash() => r'029203427f5472a864b52d493677c62b480d4132';

/// See also [maxPlanetDistance].
@ProviderFor(maxPlanetDistance)
final maxPlanetDistanceProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  maxPlanetDistance,
  name: r'maxPlanetDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxPlanetDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxPlanetDistanceRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minPlanetDistanceHash() => r'518fc6775285b6449be80dabea51c2817fde204a';

/// See also [minPlanetDistance].
@ProviderFor(minPlanetDistance)
final minPlanetDistanceProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  minPlanetDistance,
  name: r'minPlanetDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minPlanetDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinPlanetDistanceRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$maxOrbitalPeriodHash() => r'01bf9653f4f30d8d7b5754da1975597ddbdcdb0d';

/// See also [maxOrbitalPeriod].
@ProviderFor(maxOrbitalPeriod)
final maxOrbitalPeriodProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  maxOrbitalPeriod,
  name: r'maxOrbitalPeriodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxOrbitalPeriodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxOrbitalPeriodRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minOrbitalPeriodHash() => r'04393192d8f74b35e400f09faf2898e0aeb24bf4';

/// See also [minOrbitalPeriod].
@ProviderFor(minOrbitalPeriod)
final minOrbitalPeriodProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  minOrbitalPeriod,
  name: r'minOrbitalPeriodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minOrbitalPeriodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinOrbitalPeriodRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$maxPlanetMassHash() => r'6cc778d4bff5bc704f5d63907dd17940b8facc85';

/// See also [maxPlanetMass].
@ProviderFor(maxPlanetMass)
final maxPlanetMassProvider = AutoDisposeProvider<StateProvider<int>>.internal(
  maxPlanetMass,
  name: r'maxPlanetMassProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxPlanetMassHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxPlanetMassRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minPlanetMassHash() => r'877ffd5d59afe79caec9797c738e358cf1cc20c4';

/// See also [minPlanetMass].
@ProviderFor(minPlanetMass)
final minPlanetMassProvider = AutoDisposeProvider<StateProvider<int>>.internal(
  minPlanetMass,
  name: r'minPlanetMassProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minPlanetMassHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinPlanetMassRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$maxPlanetRadiusHash() => r'9b780c42cbbe53bed928a246885a9bd27c6d427e';

/// See also [maxPlanetRadius].
@ProviderFor(maxPlanetRadius)
final maxPlanetRadiusProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  maxPlanetRadius,
  name: r'maxPlanetRadiusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxPlanetRadiusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxPlanetRadiusRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minPlanetRadiusHash() => r'8d068bd8948157263ad0c60809ce309a2fd6742a';

/// See also [minPlanetRadius].
@ProviderFor(minPlanetRadius)
final minPlanetRadiusProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  minPlanetRadius,
  name: r'minPlanetRadiusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minPlanetRadiusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinPlanetRadiusRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$maxPlanetTempHash() => r'9af7ebbf04be09ffc4364dc3a2204723866b7849';

/// See also [maxPlanetTemp].
@ProviderFor(maxPlanetTemp)
final maxPlanetTempProvider = AutoDisposeProvider<StateProvider<int>>.internal(
  maxPlanetTemp,
  name: r'maxPlanetTempProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxPlanetTempHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxPlanetTempRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minPlanetTempHash() => r'3bbc543dc6a6deb65567f2ad59cf02e181f33c40';

/// See also [minPlanetTemp].
@ProviderFor(minPlanetTemp)
final minPlanetTempProvider = AutoDisposeProvider<StateProvider<int>>.internal(
  minPlanetTemp,
  name: r'minPlanetTempProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minPlanetTempHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinPlanetTempRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$maxPlanetDensityHash() => r'603a2e8e0a6bef495510e366fe978bddaa6dce8e';

/// See also [maxPlanetDensity].
@ProviderFor(maxPlanetDensity)
final maxPlanetDensityProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  maxPlanetDensity,
  name: r'maxPlanetDensityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$maxPlanetDensityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MaxPlanetDensityRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$minPlanetDensityHash() => r'3a46a400fac94d0be1e41e489c830f675fe70602';

/// See also [minPlanetDensity].
@ProviderFor(minPlanetDensity)
final minPlanetDensityProvider =
    AutoDisposeProvider<StateProvider<int>>.internal(
  minPlanetDensity,
  name: r'minPlanetDensityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$minPlanetDensityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MinPlanetDensityRef = AutoDisposeProviderRef<StateProvider<int>>;
String _$discoverPlanetMethodHash() =>
    r'c3027fa49f96518fb7a29163f0d32f0681a04d93';

/// See also [discoverPlanetMethod].
@ProviderFor(discoverPlanetMethod)
final discoverPlanetMethodProvider =
    AutoDisposeProvider<StateProvider<String>>.internal(
  discoverPlanetMethod,
  name: r'discoverPlanetMethodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$discoverPlanetMethodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DiscoverPlanetMethodRef = AutoDisposeProviderRef<StateProvider<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
