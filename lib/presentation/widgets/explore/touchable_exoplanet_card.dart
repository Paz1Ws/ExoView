import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/config/theme/theme.dart';
import 'dart:math';
import 'package:myapp/core/data/data.dart';
import 'package:myapp/presentation/screens/exoplanet/screens/exoplanet_or_ship_details.dart';
import 'package:myapp/presentation/screens/settings/providers/settings_providers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class TouchableExoplanetCard extends ConsumerStatefulWidget {
  final Exoplanet exoplanet;

  TouchableExoplanetCard({
    required this.exoplanet,
    super.key,
  });

  @override
  _TouchableExoplanetCardState createState() => _TouchableExoplanetCardState();
}

class _TouchableExoplanetCardState
    extends ConsumerState<TouchableExoplanetCard> {
  late final int maxFilledStars;
  final List<String> defaultPlanets = [
    'assets/images/planet_icons/planet_icon_1.png',
    'assets/images/planet_icons/planet_icon_2.png',
    'assets/images/planet_icons/planet_icon_3.png',
    'assets/images/planet_icons/planet_icon_4.png',
    'assets/images/planet_icons/planet_icon_5.png',
  ];
  InterstitialAd? _interstitialAd;

  final interstitialAdUnitId = Platform.isAndroid
      ? 'ca-app-pub-1697383543112830/1818662942'
      : 'ca-app-pub-3940256099942544/4411468910';

  @override
  void initState() {
    super.initState();
    maxFilledStars = Random().nextInt(5) + 1;
    _loadInterstitialAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {},
            onAdImpression: (ad) {},
            onAdFailedToShowFullScreenContent: (ad, err) {
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdClicked: (ad) {},
          );
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      debugPrint('Interstitial ad is not ready yet.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showInterstitialAd();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ExoplanetOrShipDetails(
                      exoplanet: widget.exoplanet,
                      isShip: false,
                    );
                  }));
                  ref.read(visitedExoplanetsProvider.notifier).increment();
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.brightPurple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          (defaultPlanets..shuffle()).first,
                          fit: BoxFit.cover,
                          color: AppColors.white,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          children: [
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < maxFilledStars
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 16,
                                  color: index < maxFilledStars
                                      ? AppColors.brightTealGreen
                                      : AppColors.veryDarkPurple,
                                );
                              }),
                            ),
                            Text(
                              widget.exoplanet.planetName,
                              textAlign: TextAlign.center,
                              style: AppFonts.spaceGrotesk16,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: AppColors.lightGray,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Working to display Sun 🌞 and Galaxy information 🌌'),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                        FontAwesomeIcons.galacticRepublic),
                                    iconSize: 16,
                                    color: AppColors.brightTealGreen,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Enjoy seeing exoplanets, soon sharing will be implemented 🌍'),
                                        ),
                                      );
                                    },
                                    icon:
                                        const Icon(FontAwesomeIcons.shareNodes),
                                    iconSize: 16,
                                    color: AppColors.brightTealGreen,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
