import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
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
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              model3D != null
                  ? Exoplanet3DContainer(
                      withTranslation: true,
                      model: model3D!,
                    )
                  : Expanded(
                      flex: 2,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(-size.width / 5, 0.0, 0.0),
                        child: FittedBox(
                          child: Image.asset(
                            (defaultPlanets..shuffle()).first,
                            width: size.width / 2,
                            height: size.height / 4,
                            fit: BoxFit.cover,
                            color: AppColors.lightGray,
                          ),
                        ),
                      ),
                    ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: size.width / 6, top: size.height / 12),
                  child: FittedBox(
                    fit: BoxFit.none,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              '90°',
                              style: AppFonts.spaceGrotesk16,
                            ),
                            SizedBox(
                              width: size.width / 2.5,
                              height: size.width / 2.5,
                              child: SfCircularChart(
                                  margin: EdgeInsets.zero,
                                  series: <CircularSeries>[
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
                                        yValueMapper: (ChartData data, _) =>
                                            data.y)
                                  ]),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Average Temperature.\n 3x More than Earth',
                          style: AppFonts.spaceGrotesk16,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flash Tunder Exoplanet',
                style: AppFonts.spaceGrotesk18,
              ),
              const SizedBox(
                width: 10,
              ),
              WhiteBorderContainer(
                widget: Text(
                  '2025',
                  textAlign: TextAlign.center,
                  style: AppFonts.spaceGrotesk18,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ExoplanetFeaturesWrap(
                    // exoplanet: exoplanet,
                    ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: WhiteBorderContainer(
                          withAnimation: false,
                          width: 50,
                          height: 50,
                          widget: IconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {},
                          )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child:
                            PurpleButton(text: 'Book A Travel', onTap: () {})),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: WhiteBorderContainer(
                          withAnimation: false,
                          width: 50,
                          height: 50,
                          widget: IconButton(
                            icon: const Icon(
                              Icons.arrow_right,
                              size: 25,
                              color: AppColors.lightGray,
                            ),
                            onPressed: () {},
                          )),
                    )
                  ],
                ),
              ],
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

class ChartData {
  ChartData(this.y, this.color);

  final double y;
  final Color color;
}
