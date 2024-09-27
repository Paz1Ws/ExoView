import 'package:flutter/material.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.sort,
                    color: AppColors.softPurple,
                  ),
                  Text(
                    'Sort by ',
                    style: AppFonts.spaceGrotesk18,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: 6,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       mainAxisSpacing: 20,
          //       crossAxisSpacing: 20,
          //     ),
          //     itemBuilder: (context, index) {
          //       return TouchableExoplanetCard(
          //           exoplanetCategory: exoplanetCategories[index],
          //           onTap: () {
          //             Navigator.of(context).push(MaterialPageRoute(
          //                 builder: (context) => ExoplanetOrShipDetails()));
          //           });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
