import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PurpleBackground(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
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
              'List of the 8 most famous exoplanets',
              style: AppFonts.spaceGrotesk12,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width / 1.2,
              child: const ModelViewer(
                backgroundColor: Colors.transparent,
                src: 'assets/animations/55_cancri.glb',
                alt: 'A 3D model of an astronaut',
                ar: true,
                autoRotate: true,
                disableZoom: true,
              ),
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
