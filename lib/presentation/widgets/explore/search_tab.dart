import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/colors.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/explore/providers/explore_view_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import '../../screens/home/providers/exoplanet_providers.dart';

class SearchTab extends ConsumerWidget {
  const SearchTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return WhiteBorderContainer(
        border: 6,
        width: double.infinity,
        widget: Container(
            decoration: BoxDecoration(
              color: AppColors.veryDarkPurple,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: const Icon(Icons.search),
                        hintText: 'Search...',
                        hintStyle: AppFonts.spaceGrotesk16,
                        border: InputBorder.none,
                      ),
                      style: AppFonts.spaceGrotesk16,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.tune,
                      color: AppColors.lightGray,
                    ),
                    onPressed: () {
                      showFilterModal(context, ref);
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.brightTealGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )));
  }
}
