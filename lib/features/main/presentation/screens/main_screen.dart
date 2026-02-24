import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../gen/assets.gen.dart';
import '../blocs/form_status_cubit.dart';
import '../widgets/android_body_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/ios_body_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, this.deviceId});

  final String? deviceId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormStatusCubit(),
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
        context.read<FormStatusCubit>().tryOpenForm();
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

    return BlocConsumer<FormStatusCubit, FormStatusState>(
      listenWhen: (prev, curr) => curr.shouldOpen && !prev.shouldOpen,
      listener: (context, state) async {
        if (state.controller != null) {
          await context.push(
            AppRoutes.hiddenForm.path,
            extra: state.controller,
          );
          if (context.mounted) {
            context.read<FormStatusCubit>().formClosed();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: true,
          endDrawer: DrawerWidget(),
          body: BGWidget(
            child: Platform.isIOS
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
          ),
        );
      },
    );
  }
}
