import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/util/filter_cases.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/explore/providers/explore_view_providers.dart';

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

  @override
  void initState() {
    super.initState();

    switch (widget.text) {
      case 'Date of Discovery':
        rangeValues = getDiscoveryYearRange(widget.exoplanets);
        break;
      case 'Mass of Exoplanet':
        rangeValues = getPlanetMassRange(widget.exoplanets);
        break;
      case 'Radius of Exoplanet':
        rangeValues = getPlanetRadiusRange(widget.exoplanets);
        break;
      case 'Orbital Period':
        rangeValues = getOrbitalPeriodRange(widget.exoplanets);
        break;
      case 'Is of Controversial Origin?':
        rangeValues = getControversialOriginRange(widget.exoplanets);
        break;
      case 'Discovery Method':
        rangeValues = getDiscoveryMethodRange(widget.exoplanets);
        break;
      case 'Equilibrium Temperature':
        rangeValues = getPlanetTempRange(widget.exoplanets);
        break;
      case 'Density':
        rangeValues = getPlanetDensityRange(widget.exoplanets);
        break;
      case 'Transit Duration':
        rangeValues = getTransitDurationRange(widget.exoplanets);
        break;
      case 'Insolation Flux':
        rangeValues = getInsolationFluxRange(widget.exoplanets);
        break;
      default:
        throw ArgumentError('Invalid property: ${widget.text}');
    }

    minRange = rangeValues.start;
    maxRange = rangeValues.end;
  }

  @override
  Widget build(BuildContext context) {
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
          divisions: (maxRange - minRange).round(),
          labels: RangeLabels(
            rangeValues.start.toInt().toString(),
            rangeValues.end.toInt().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              rangeValues = values;
              switch (widget.text) {
                case 'Date of Discovery':
                  ref
                      .read(discoveryYearRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Mass of Exoplanet':
                  ref
                      .read(planetMassRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Radius of Exoplanet':
                  ref
                      .read(planetRadiusRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Orbital Period':
                  ref
                      .read(orbitalPeriodRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Is of Controversial Origin?':
                  ref
                      .read(controversialOriginRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Discovery Method':
                  ref
                      .read(discoveryMethodRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Equilibrium Temperature':
                  ref
                      .read(planetTempRangeProvider.state)
                      .setRangeValues(rangeValues);
                  break;
                case 'Density':
                  ref
                      .read(planetDensityRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Transit Duration':
                  ref
                      .read(transitDurationRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                case 'Insolation Flux':
                  ref
                      .read(insolationFluxRangeProvider.notifier)
                      .setRangeValues(rangeValues);
                  break;
                default:
                  throw ArgumentError('Invalid property: ${widget.text}');
              }
            });
          },
        ),
      ],
    );
  }
}
