import 'package:flutter/material.dart';

class PlanetsBackground extends StatefulWidget {
  final Widget content;
  final bool withOpacity;
  const PlanetsBackground({
    super.key,
    this.withOpacity = true,
    required this.content,
  });

  @override
  State<PlanetsBackground> createState() => _PlanetsBackgroundState();
}

class _PlanetsBackgroundState extends State<PlanetsBackground> {
  final Image background =
      Image.asset('assets/images/background_image.webp', fit: BoxFit.cover);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(background.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            widget.withOpacity
                ? Stack(
                    children: [
                      SizedBox(
                          width: size.width,
                          height: size.height,
                          child: background),
                      Container(
                        width: size.width,
                        height: size.height,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  )
                : SizedBox(
                    width: size.width, height: size.height, child: background),
            widget.content
          ],
        ));
  }
}
