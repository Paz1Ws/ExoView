import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/util/filter_cases.dart';
import 'package:myapp/core/data/data.dart';

import '../../../screens/explore/providers/explore_view_providers.dart';

class FilterSection extends ConsumerStatefulWidget {
  final String text;
  final List<Exoplanet> exoplanets;
  const FilterSection({
    required this.text,
    required this.exoplanets,
    super.key,
  });

  @override
  ConsumerState<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends ConsumerState<FilterSection> {
  late RangeValues rangeValues;
  late double minRange;
  late double maxRange;
  late RangeValues prov;

  final Map<String, Function> rangeFunctions = {
    'Date of Discovery': getDiscoveryYearRange,
    'Mass of Exoplanet': getPlanetMassRange,
    'Radius of Exoplanet': getPlanetRadiusRange,
    'Orbital Period': getOrbitalPeriodRange,
    'Equilibrium Temperature': getPlanetTempRange,
    'Density': getPlanetDensityRange,
    'Transit Duration': getTransitDurationRange,
    'Insolation Flux': getInsolationFluxRange,
  };

  final Map<String, AutoDisposeProvider<RangeValues>> providers = {
    'Date of Discovery': discoveryYearRangeProvider,
    'Mass of Exoplanet': planetMassRangeProvider,
    'Radius of Exoplanet': planetRadiusRangeProvider,
    'Orbital Period': orbitalPeriodRangeProvider,
    'Equilibrium Temperature': planetTempRangeProvider,
    'Density': planetDensityRangeProvider,
    'Transit Duration': transitDurationRangeProvider,
    'Insolation Flux': insolationFluxRangeProvider,
  };

  @override
  void initState() {
    super.initState();

    if (rangeFunctions.containsKey(widget.text) &&
        providers.containsKey(widget.text)) {
      rangeValues = rangeFunctions[widget.text]!(widget.exoplanets);
      prov = ref.read(providers[widget.text]!);
    } else {
      throw ArgumentError('Invalid property: ${widget.text}');
    }

    minRange = rangeValues.start;
    maxRange = rangeValues.end;
  }

  void updateFilteredExoplanets(RangeValues values) {
    List<Exoplanet> filteredExoplanets = widget.exoplanets.where((exoplanet) {
      switch (widget.text) {
        case 'Date of Discovery':
          return exoplanet.discoveryYear >= values.start &&
              exoplanet.discoveryYear <= values.end;
        case 'Mass of Exoplanet':
          return exoplanet.massEarthMass >= values.start &&
              exoplanet.massEarthMass <= values.end;
        case 'Radius of Exoplanet':
          return exoplanet.radiusEarthRadius >= values.start &&
              exoplanet.radiusEarthRadius <= values.end;
        case 'Orbital Period':
          return exoplanet.orbitalPeriodDays >= values.start &&
              exoplanet.orbitalPeriodDays <= values.end;
        case 'Equilibrium Temperature':
          return exoplanet.equilibriumTemperature >= values.start &&
              exoplanet.equilibriumTemperature <= values.end;
        case 'Density':
          return exoplanet.density >= values.start &&
              exoplanet.density <= values.end;
        case 'Transit Duration':
          return exoplanet.transitDurationHours >= values.start &&
              exoplanet.transitDurationHours <= values.end;
        case 'Insolation Flux':
          return exoplanet.insolationFlux >= values.start &&
              exoplanet.insolationFlux <= values.end;
        default:
          return false;
      }
    }).toList();

    final existingExoplanets = ref.read(filteredExoplanetsProvider);
    final existingExoplanetIds =
        existingExoplanets.map((e) => e.planetName).toSet();
    final newExoplanets = filteredExoplanets
        .where((e) => !existingExoplanetIds.contains(e.planetName))
        .toList();
    ref.read(filteredExoplanetsProvider.notifier).state = [
      ...existingExoplanets,
      ...newExoplanets
    ];
  }

  @override
  Widget build(BuildContext context) {
    final division =
        (maxRange - minRange).round() <= 0 ? 1 : (maxRange - minRange).round();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: AppFonts.spaceGrotesk16.copyWith(
            color: AppColors.lightGray,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RangeSlider(
          min: minRange,
          max: maxRange,
          activeColor: AppColors.brightPurple,
          inactiveColor: AppColors.lightGray,
          values: rangeValues,
          divisions: division,
          labels: RangeLabels(
            rangeValues.start.toInt().toString(),
            rangeValues.end.toInt().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              rangeValues = values;
              prov = values;
              updateFilteredExoplanets(values);
            });
          },
        ),
      ],
    );
  }
}
