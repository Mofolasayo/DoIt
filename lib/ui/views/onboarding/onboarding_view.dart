import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/common/app_colors.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:todo_app/ui/widgets/general/custom_scaffold.dart';
import 'package:todo_app/ui/widgets/responsive/responsive_text.dart';

import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({super.key});

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) =>
      OnboardingViewModel();

  @override
  Widget builder(
      BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return CustomScaffold(
      showAppBar: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.55,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                viewModel.setCurrentIndex(index);
              },
            ),
            items: viewModel.onboardingData.map((data) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    data["image"]!,
                    height: 290,
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ResponsiveText.w700(
                      data["title"]!,
                      textAlign: TextAlign.center,
                      fontSize: 32,
                      color: kWhite,
                    ),
                  ),
                  verticalSpaceSmall,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ResponsiveText.w400(
                      data["description"]!,
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: const Color.fromARGB(167, 255, 255, 255),
                    ),
                  )
                ],
              );
            }).toList(),
          ),
          // verticalSpaceCustom(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              viewModel.onboardingData.length,
              (index) => carouselDot(
                index,
                viewModel.currentIndex,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget carouselDot(int index, int currentIndex) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: currentIndex == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? kPrimaryColor
            : const Color.fromARGB(167, 255, 255, 255),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
