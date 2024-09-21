import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/home/screens/home_view_controller.dart';
import 'package:myapp/presentation/screens/screens.dart';
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/successful_stars.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Succesfully \nEnrolled!',
                              maxLines: 2,
                              style: AppFonts.spaceGrotesk40.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: AppColors.brightTealGreen)),
                          Text('One click away from your travel',
                              style: AppFonts.spaceGrotesk16.copyWith(
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.w800,
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PurpleButton(
                    text: 'Start Exploring',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeViewController()));
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
