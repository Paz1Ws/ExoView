
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

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
    RangeValues  rangeValues = ref.watch(discoverYearProvider(widget.exoplanets));
    final rangeNotifier =
        ref.read(discoverYearProvider(widget.exoplanets).notifier);

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
          divisions: 3,
          onChanged: (RangeValues values) {
            rangeValues = values;
            rangeNotifier.updateRange(values);

          },
        ),
      ],
    );
  }
}
