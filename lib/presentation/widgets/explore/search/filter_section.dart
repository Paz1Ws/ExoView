import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';

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
  @override
  Widget build(BuildContext context) {
    RangeValues rangeValues = RangeValues(0, 0);
    StateNotifierProvider<DiscoverYearNotifier, RangeValues> rangeProvider;

    switch (widget.text) {
      case 'Date of Discovery':
        rangeProvider = discoverYearProvider(widget.exoplanets);
        break;
      // Uncomment and add other cases as needed
      // case 'Distance from Earth':
      //   rangeProvider = distanceProvider(widget.exoplanets);
      //   break;
      // case 'Mass of Exoplanet':
      //   rangeProvider = massProvider(widget.exoplanets);
      //   break;
      // case 'Radius of Exoplanet':
      //   rangeProvider = radiusProvider(widget.exoplanets);
      //   break;
      // case 'Orbital Period':
      //   rangeProvider = orbitalPeriodProvider(widget.exoplanets);
      //   break;
      // case 'Is of Controversial Origin?':
      //   rangeProvider = controversialOriginProvider(widget.exoplanets);
      //   break;
      default:
        throw Exception('Unknown filter type');
    }

    rangeValues = ref.watch(rangeProvider);
    final rangeNotifier = ref.read(rangeProvider.notifier);

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
          min: rangeValues.start,
          max: rangeValues.end,
          activeColor: AppColors.brightPurple,
          inactiveColor: AppColors.lightGray,
          values: rangeValues,
          onChanged: (RangeValues values) {
            rangeNotifier.updateRange(values);
          },
        ),
      ],
    );
  }
}
