import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';

class BackgroundWithImage extends StatefulWidget {
  final Widget body;
  final int backgroundIndex;
  final bool withOpacity;

  const BackgroundWithImage({
    super.key,
    required this.backgroundIndex,
    this.withOpacity = false,
    required this.body,
  });

  @override
  State<BackgroundWithImage> createState() => _BackgroundWithImageState();
}

class _BackgroundWithImageState extends State<BackgroundWithImage> {
  List<Image> backgrounds = [
    Image.asset('assets/images/backgrounds/background_image.webp',
        colorBlendMode: BlendMode.dstOut, fit: BoxFit.cover),
    Image.asset('assets/images/backgrounds/austronaut_background.webp',
        fit: BoxFit.cover),
    Image.asset('assets/images/backgrounds/earth_background.webp',
        fit: BoxFit.cover),
    Image.asset('assets/images/backgrounds/forgot_password_background.webp',
        fit: BoxFit.cover)
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(backgrounds[0].image, context);

    precacheImage(backgrounds[1].image, context);

    precacheImage(backgrounds[2].image, context);
    precacheImage(backgrounds[3].image, context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: widget.backgroundIndex == 1
            ? AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title:
                    Text('Create new account', style: AppFonts.spaceGrotesk18),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.veryLightGray,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            : null,
        body: Stack(
          children: [
            widget.withOpacity
                ? Stack(
                    children: [
                      SizedBox(
                          width: size.width,
                          height: size.height,
                          child: backgrounds[widget.backgroundIndex]),
                      Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  )
                : SizedBox(
                    width: size.width,
                    height: size.height,
                    child: backgrounds[widget.backgroundIndex],
                  ),
            widget.body
          ],
        ));
  }
}
