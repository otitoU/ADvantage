import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/constants.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Image.asset(
                    'assets/images/Ad_Logo.png',
                    width: 400,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 4;
                    });
                  },
                  children: [
                    _buildPage(
                      title: 'Boost ROI by 30%',
                      subtitle:
                          'AI-driven advertising maximizes engagement and reduces costs.',
                      icon: Icons.trending_up,
                    ),
                    _buildPage(
                      title: 'Reduce Acquisition Costs',
                      subtitle:
                          'Cut customer acquisition costs by 20% with precision targeting.',
                      icon: Icons.attach_money,
                    ),
                    _buildPage(
                      title: 'Increase Conversions',
                      subtitle:
                          'Personalized AI-driven ads improve conversion rates by 25%.',
                      icon: Icons.check_circle_outline,
                    ),
                    _buildPage(
                      title: 'Eco-Friendly AI Advertising',
                      subtitle:
                          'Use energy-efficient AI models to reduce carbon footprint.',
                      icon: Icons.eco,
                    ),
                    _buildPage(
                      title: 'Let’s Get Started',
                      subtitle:
                          'Set up your business profile and launch AI-optimized ads.',
                      icon: Icons.business,
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.secondary,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: isLastPage ? 'Get Started' : 'Next',
                onPressed: () {
                  if (isLastPage) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: AppColors.secondary),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
