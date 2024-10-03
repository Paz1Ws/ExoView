// Suggested code may be subject to a license. Learn more: ~LicenseLog:2823283911.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1963190590.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4216398412.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2382415872.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3719101777.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:540051175.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3535339102.
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:myapp/config/failures/failures.dart';
import 'package:myapp/config/theme/fonts.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/core/data/models/exoplanet_model.dart';
import 'package:myapp/presentation/screens/home/providers/exoplanet_providers.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class ExploreSectionDetails extends ConsumerWidget {
  final String section;
  ExploreSectionDetails({super.key, required this.section});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exoplanetsAsyncValue = ref.watch(exoplanetsProvider);
    return PurpleBackground(
      withNavigation: false,
      withAppBar: true,
      appBarTitle: 'Explore',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Exoplanet3DContainer(
                    translation: Matrix4.identity()
                      ..translate(
                          -MediaQuery.sizeOf(context).width / 5, 0.0, 0.0),
                    model: 'assets/animations/exoplanets/sun.glb'),
                Positioned(
                  right: 20,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '$section\n+999 avalaibles',
                      style: AppFonts.spaceGrotesk40.copyWith(fontSize: 25),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: FutureBuilder<Either<Failure, List<Exoplanet>>>(
                future: exoplanetsAsyncValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final exoplanets = snapshot.data!;
                    return exoplanets.fold(
                      (failure) => Center(child: Text('Error: $failure')),
                      (exoplanets) => GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                        itemCount: exoplanets.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                          final exoplanet = exoplanets[index];
                  return TouchableExoplanetCard(
                    exoplanet: exoplanet,
                         
                          );
                        },
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

