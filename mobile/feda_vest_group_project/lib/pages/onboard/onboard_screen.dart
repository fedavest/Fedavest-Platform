import 'package:feda_vest_group_project/constants/app_colors.dart';
import 'package:feda_vest_group_project/constants/asset_images.dart';
import 'package:feda_vest_group_project/global_widgets/app_button.dart';
import 'package:feda_vest_group_project/routes/route_name.dart';
import 'package:feda_vest_group_project/widgets/index.dart';
import 'package:flutter/material.dart';

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingData> onboardingList = [
    OnboardingData(
      image: AuthImages.onBoard1,
      title: "Invest in Agriculture, End Hunger Together",
      description:
          "Discover verified agro businesses tackling food insecurity, "
          "FedaVest connects you to impactful opportunities that grow food, "
          "businesses and communities.",
    ),
    OnboardingData(
      image: AuthImages.onBoard2,
      title: "Verified SMEs. Smarter Investments.",
      description:
          "Our AI scoring verifies agro SMEs, highlights risks and matches you with opportunities aligned to food and security impact.",
    ),
    OnboardingData(
      image: AuthImages.onBoard3,
      title: "Grow Food. Grow Wealth. Grow Impact.",
      description:
          "Track funding, monitor impact and support sustainable agriculture in an all in one platform.",
    ),
  ];

  void nextPage() {
    if (currentIndex < onboardingList.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
  Navigator.pushReplacementNamed(context, RouteName.signUp);

    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingList.length,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final item = onboardingList[index];

          return Column(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// Skip Button
                    Positioned(
                      top: size.height * 0.06,
                      right: size.width * 0.05,
                      child: TextButton(
                        onPressed: () {},
                        child: GestureDetector(
                           onTap: (){
                          Navigator.pushReplacementNamed(context, RouteName.signUp);
                        },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Bottom Card
                    Align(
                      alignment: const Alignment(0, 0.85),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.height * 0.035,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Title
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: size.height * 0.015),

                              /// Description
                              Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width * 0.038,
                                  color: AppColors.appTextColor,
                                  height: 1.5,
                                ),
                              ),

                              SizedBox(height: size.height * 0.025),

                              /// Indicator
                              IndexIndicator(onboardingList: onboardingList, size: size, currentIndex: currentIndex),

                              SizedBox(height: size.height * 0.03),

                              /// Next Button
                              SizedBox(
                                width: double.infinity,
                                height: size.height * 0.065,
                                child: AppButton(
                                  text: currentIndex ==
                                          onboardingList.length - 1
                                      ? "Get Started"
                                      : "Next",
                                  icon: Icons.arrow_forward,
                                  showIcon: true,
                                  onTap: nextPage,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
