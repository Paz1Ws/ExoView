import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GSD.2163.08.15.01.40',
                    style: AppFonts.spaceGrotesk16,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'List of the 7 most famous exoplanets',
                    style: AppFonts.spaceGrotesk12,
                  ),
                  Text(
                    'Details in Explore Section',
                    style: AppFonts.spaceGrotesk12.copyWith(
                      color: AppColors.lightGray,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                CurveOfExoplanets(),
                const Exoplanet3DContainer(
                  model: 'assets/animations/exoplanets/sun.glb',
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Where do you want to go?',
                    style: AppFonts.spaceGrotesk18,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Choose your cosmic journey',
                    style: AppFonts.spaceGrotesk12.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// class ExoplanetsViewer extends ConsumerWidget {
//   const ExoplanetsViewer({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final exoplanetsAsyncValue = ref.watch(exoplanetsProvider);

//     return exoplanetsAsyncValue.when(
//       data: (exoplanets) {
//         return ListView.builder(
//           itemCount: exoplanets.length,
//           itemBuilder: (context, index) {
//             final exoplanet = exoplanets[index];
//             return ListTile(
//               title: Text(exoplanet.name),
//               subtitle: Text(exoplanet.description),
//             );
//           },
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error, stack) => Center(child: Text('Error: $error')),
//     );
//   }
// }
