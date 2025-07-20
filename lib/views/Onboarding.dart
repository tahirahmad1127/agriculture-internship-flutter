import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding/onboarding_1.dart';
import 'onboarding/onboarding_2.dart';
import 'onboarding/onboarding_3.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
              ],
            ),
          ),

          SizedBox(
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Page indicator (centered)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const SlideEffect(
                        dotWidth: 6,
                        dotHeight: 6,
                        activeDotColor: Color(0xff339D44),
                      ),
                    ),
                  ),
                ),

                // Skip button (bottom right)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 20),
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.raleway(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff339D44),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
