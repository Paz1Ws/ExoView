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
    } else {
      throw ArgumentError('Invalid property: ${widget.text}');
    }

    minRange = rangeValues.start;
    maxRange = rangeValues.end;

    rangeValues = ref.read(providers[widget.text]!);
  }

  void updateFilteredExoplanets() {
    List<Exoplanet> newFilteredExoplanets = widget.exoplanets;

    providers.forEach((key, provider) {
      final range = ref.read(provider);
      newFilteredExoplanets = newFilteredExoplanets.where((exoplanet) {
        switch (key) {
          case 'Date of Discovery':
            return exoplanet.discoveryYear >= range.start &&
                exoplanet.discoveryYear <= range.end;
          case 'Mass of Exoplanet':
            return exoplanet.massEarthMass >= range.start &&
                exoplanet.massEarthMass <= range.end;
          case 'Radius of Exoplanet':
            return exoplanet.radiusEarthRadius >= range.start &&
                exoplanet.radiusEarthRadius <= range.end;
          case 'Orbital Period':
            return exoplanet.orbitalPeriodDays >= range.start &&
                exoplanet.orbitalPeriodDays <= range.end;
          case 'Equilibrium Temperature':
            return exoplanet.equilibriumTemperature >= range.start &&
                exoplanet.equilibriumTemperature <= range.end;
          case 'Density':
            return exoplanet.density >= range.start &&
                exoplanet.density <= range.end;
          case 'Transit Duration':
            return exoplanet.transitDurationHours >= range.start &&
                exoplanet.transitDurationHours <= range.end;
          case 'Insolation Flux':
            return exoplanet.insolationFlux >= range.start &&
                exoplanet.insolationFlux <= range.end;
          default:
            return true;
        }
      }).toList();
    });

    ref.read(filteredExoplanets.notifier).state = newFilteredExoplanets;
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
              ref.read(providers[widget.text]!).start = values.start;
              ref.read(providers[widget.text]!).end = values.end;
              updateFilteredExoplanets();
            });
          },
        ),
      ],
    );
  }
}
