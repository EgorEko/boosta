import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/amount_cubit.dart';
import '../widgets/android_body_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/ios_body_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AmountCubit(),
      child: MainScreenContent(),
    );
  }
}

class MainScreenContent extends StatefulWidget {
  const MainScreenContent({super.key});

  @override
  State<MainScreenContent> createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<MainScreenContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.locale!.customAmounts,
      context.locale!.noExtraCharges,
      context.locale!.dataSecurity,
      context.locale!.fastPayouts,
    ];

    final List<ImageProvider> icons = [
      Assets.elements.fluentMoney16Filled.provider(),
      Assets.elements.fluentDataPie24Regular.provider(),
      Assets.elements.mingcuteSafeLockLine.provider(),
      Assets.elements.mdiClockFast.provider(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      endDrawer: DrawerWidget(),
      body: BGWidget(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              context.isKeyboardVisible
                  ? SizedBox()
                  : Platform.isIOS
                  ? IosBodyWidget(
                      titles: titles,
                      scaffoldKey: _scaffoldKey,
                      icons: icons,
                    )
                  : AndroidBodyWidget(
                      titles: titles,
                      scaffoldKey: _scaffoldKey,
                      icons: icons,
                    ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.icons.security.image(),
                  5.horizontalSpace,
                  Text(
                    context.locale!.builtInSecurity,
                    style: AppTextStyles.serviceFont.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              PrimaryButton(
                onPressed: () {
                  context.push(AppRoutes.hiddenForm.path);
                },
                child: Text(
                  context.locale!.applyForALoan.toUpperCase(),
                  style: AppTextStyles.buttonFont.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
