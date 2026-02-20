import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/blocs/app_settings_cubit/app_settings_cubit.dart';
import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/page_view_cubit.dart';
import '../widgets/onboarding_body_widget.dart';
import '../widgets/page_indicator_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageViewCubit(),
      child: OnboardingScreenContent(),
    );
  }
}

class OnboardingScreenContent extends StatefulWidget {
  const OnboardingScreenContent({super.key});

  @override
  State<OnboardingScreenContent> createState() =>
      _OnboardingScreenContentState();
}

class _OnboardingScreenContentState extends State<OnboardingScreenContent>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      Center(
        child: OnboardingBodyWidget(
          firstTitle: context.locale!.speedy.toUpperCase(),
          secondTitle: context.locale!.approvals.toUpperCase(),
          slogan: context.locale!.sloganFirst,
          leftTopIcon: Assets.elements.lightning.image(fit: BoxFit.cover),
          rightTopIcon: Assets.elements.fluyingDol.image(fit: BoxFit.cover),
          centerIcon: Assets.elements.portrait.image(
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          rightBottomIcon: Assets.elements.portal.image(fit: BoxFit.cover),
        ),
      ),
      Center(
        child: OnboardingBodyWidget(
          firstTitle: context.locale!.fast.toUpperCase(),
          secondTitle: context.locale!.setup.toUpperCase(),
          slogan: context.locale!.sloganSecond,
          leftTopIcon: Assets.elements.arrow3.image(fit: BoxFit.cover),
          centerRightIcon: Assets.elements.smile.image(fit: BoxFit.cover),
          centerIcon: Assets.elements.portraitGirl.image(
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          rightBottomIcon: Assets.elements.flyingHundredUsDollar.image(
            fit: BoxFit.cover,
          ),
        ),
      ),
      Center(
        child: OnboardingBodyWidget(
          firstTitle: context.locale!.begin.toUpperCase(),
          secondTitle: context.locale!.today.toUpperCase(),
          slogan: context.locale!.sloganThird,
          leftTopIcon: Assets.elements.checkmark.image(fit: BoxFit.cover),
          rightTopIcon: Assets.elements.flyingDolBack.image(fit: BoxFit.cover),
          centerIcon: Assets.elements.portraitGirl1.image(
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          leftBottomIcon: Assets.elements.lightningSecond.image(
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];

    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: Center(
            child: BlocBuilder<PageViewCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          PageView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _pageViewController,
                            itemCount: pages.length,
                            onPageChanged: (index) {
                              _tabController.animateTo(index);
                              context.read<PageViewCubit>().setCurrentPageIndex(
                                index,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return AnimatedBuilder(
                                animation: _pageViewController,
                                builder: (context, child) {
                                  double value = 1.0;
                                  if (_pageViewController
                                      .position
                                      .haveDimensions) {
                                    value = _pageViewController.page! - index;
                                    value = (1 - (value.abs() * 0.5)).clamp(
                                      0.0,
                                      1.0,
                                    );
                                  }
                                  return Opacity(
                                    opacity: value,
                                    child: Transform.scale(
                                      scale: 0.9 + (value * 0.1),
                                      child: SingleChildScrollView(
                                        child: pages[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          PageIndicatorWidget(tabController: _tabController),
                        ],
                      ),
                    ),
                    PrimaryButton(
                      onPressed: () {
                        _updateCurrentPageIndex();
                      },
                      child: Text(
                        state == 2
                            ? context.locale!.applyForALoan.toUpperCase()
                            : context.locale!.continueButton.toUpperCase(),
                        style: AppTextStyles.buttonFont.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateCurrentPageIndex() async {
    final lastIndex = _tabController.length - 1;
    final currentIndex = _tabController.index;

    if (currentIndex == lastIndex) {
      if (mounted) {
        context.read<AppSettingsCubit>().completeOnboarding();
        context.go(AppRoutes.main.path);
      }
      return;
    }

    final nextIndex = currentIndex + 1;

    await _pageViewController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );

    _tabController.animateTo(nextIndex);

    if (mounted) {
      context.read<PageViewCubit>().setCurrentPageIndex(nextIndex);
    }
  }
}
