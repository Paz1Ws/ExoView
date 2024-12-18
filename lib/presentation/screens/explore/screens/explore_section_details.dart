// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:myapp/core/data/models/exoplanet_model.dart';
// import 'package:myapp/presentation/widgets/widgets.dart';

// class ExploreSectionDetails extends ConsumerWidget {
//   final String section;
//   final List<Exoplanet>? exoplanets;
//   ExploreSectionDetails({super.key, required this.section, this.exoplanets});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return PurpleBackground(
//       withNavigation: false,
//       withAppBar: true,
//       appBarTitle: 'Explore',
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Stack(
//               alignment: Alignment.centerRight,
//               children: [
//                 Exoplanet3DContainer(
//                     translation: Matrix4.identity()
//                       ..translate(
//                           -MediaQuery.sizeOf(context).width / 5, 0.0, 0.0),
//                     model: 'assets/animations/exoplanets/55_cancri.glb'),
//                 Positioned(
//                     right: 20,
//                     child: Text(
//                       '$section\n Avalaibles: ${exoplanets!.length}',
//                     )),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: exoplanets!.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 20,
//                   crossAxisSpacing: 20,
//                 ),
//                 itemBuilder: (context, index) {
//                   final exoplanet = exoplanets![index];
//                   return TouchableExoplanetCard(
//                     exoplanet: exoplanet,
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
