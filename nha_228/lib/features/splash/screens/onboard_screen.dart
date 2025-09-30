import 'package:flutter/material.dart';
import 'package:nha_228/features/splash/widgets/custom_indicator.dart';
import 'package:nha_228/features/splash/widgets/first_onboard_widget.dart';
import 'package:nha_228/features/splash/widgets/onboarding_footer.dart';
import 'package:nha_228/features/splash/widgets/second_onboard_widget.dart';
import 'package:nha_228/features/splash/widgets/third_onboard_widget.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
 final _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: _controller,
                children: [FirstScreen(), SecondScreen(), ThirdScreen()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(active: index == 0),
                CustomIndicator(active: index == 1),
                CustomIndicator(active: index == 2),
              ],
            ),
            SizedBox(height: 40),
            OnboardingFooter(controller: _controller, index: index),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
