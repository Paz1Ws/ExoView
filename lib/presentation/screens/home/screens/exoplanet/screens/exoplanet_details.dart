import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ExoplanetDetails extends StatelessWidget {
  final String? model3D;
  //final Exoplanet exoplanet;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  final List<ChartData> chartData = [
    ChartData(5, AppColors.softPurple),
    ChartData(15, AppColors.purple),
    ChartData(25, AppColors.brightPurple),
    ChartData(55, const Color.fromARGB(255, 55, 29, 76))
  ];
  ExoplanetDetails({
    super.key,
    //  required this.exoplanet,
    this.model3D,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                model3D != null
                    ? Exoplanet3DContainer(
                        withTranslation: true,
                        model: model3D!,
                      )
                    : Expanded(
                        flex: 1,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(-MediaQuery.sizeOf(context).width / 5,
                                0.0, 0.0),
                          child: Image.asset(
                            (defaultPlanets..shuffle()).first,
                            width: MediaQuery.sizeOf(context).width / 1.5,
                            height: MediaQuery.sizeOf(context).height / 1.5,
                            color: AppColors.lightGray,
                          ),
                        ),
                      ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            'Temperature',
                            style: AppFonts.spaceGrotesk16,
                          ),
                          Expanded(
                            child: FittedBox(
                              child: SfCircularChart(series: <CircularSeries>[
                                // Renders doughnut chart
                                DoughnutSeries<ChartData, String>(
                                    dataSource: chartData,
                                    startAngle: 360,
                                    endAngle: -360,
                                    innerRadius: '60%',
                                    radius: '100%',
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) =>
                                        data.y.toString(),
                                    yValueMapper: (ChartData data, _) => data.y)
                              ]),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Average Temperature.\n 3x More than Earth',
                        style: AppFonts.spaceGrotesk16,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        // Row(
        //   children: [
        //     Text(
        //       'Exoplanet',
        //       style: AppFonts.spaceGrotesk18,
        //     ),
        //     WhiteBorderContainer(
        //       widget: Text(
        //         '1234',
        //         textAlign: TextAlign.center,
        //         style: AppFonts.spaceGrotesk18,
        //       ),
        //     )
        //   ],
        // ),
        // ExoplanetFeaturesWrap(
        //     // exoplanet: exoplanet,
        //     ),
        // Row(
        //   children: [
        //     WhiteBorderContainer(
        //         widget: IconButton(
        //       icon: const Icon(
        //         Icons.favorite_border,
        //         color: Colors.red,
        //       ),
        //       onPressed: () {},
        //     )),
        //     PurpleButton(text: 'Start Exploring', onTap: () {}),
        //     WhiteBorderContainer(
        //         widget: IconButton(
        //       icon: const Icon(FontAwesomeIcons.arrowRight),
        //       onPressed: () {},
        //     ))
        //   ],
        // ),
      ]),
    );
  }
}

class ChartData {
  ChartData(this.y, this.color);

  final double y;
  final Color color;
}
