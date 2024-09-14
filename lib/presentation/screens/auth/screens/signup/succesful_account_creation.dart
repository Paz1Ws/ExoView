import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class SuccesfulAccountCreation extends StatefulWidget {
  const SuccesfulAccountCreation({super.key});

  @override
  State<SuccesfulAccountCreation> createState() =>
      _SuccesfulAccountCreationState();
}

class _SuccesfulAccountCreationState extends State<SuccesfulAccountCreation> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWithImage(
        backgroundIndex: 2,
        body: Stack(
          children: [
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   child: earthBackground,
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Account Was Succesfully Created!',
                      style: AppFonts.spaceGrotesk18
                          .copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('One click away from your travel',
                      style: AppFonts.spaceGrotesk16.copyWith(
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.w800,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  PurpleButton(
                    text: 'Start Exploring',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
