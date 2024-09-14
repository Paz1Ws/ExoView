import 'package:flutter/material.dart';
import 'package:myapp/config/theme/theme.dart';
import 'package:myapp/presentation/screens/screens.dart';
import 'package:myapp/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWithImage(
      backgroundIndex: 0,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hallo!',
                style: AppFonts.spaceGrotesk40
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Please login to start',
                style: AppFonts.spaceGrotesk18
                    .copyWith(color: AppColors.lightGray)),
            const SizedBox(height: 20),
            const InsertCredencialsContainer(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 1,
                  color: AppColors.lightGray,
                ),
                Text(
                  'Or continue with',
                  style: AppFonts.spaceGrotesk16
                      .copyWith(color: AppColors.lightGray),
                ),
                Container(
                  width: 10,
                  height: 1,
                  color: AppColors.lightGray,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const AuthMethods(),
            const SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text('If you don\'t have an account, you can',
                    style: AppFonts.spaceGrotesk16
                        .copyWith(color: AppColors.lightGray)),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CreateNewAccount()));
                    },
                    child: Text(
                      'register here',
                      style: AppFonts.spaceGrotesk16
                          .copyWith(color: AppColors.brightTealGreen),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
