import 'package:flutter/material.dart';

import '../../../../core/common/utils/extensions.dart';
import '../../../../core/common/widgets/bg_widgets/bg_widget.dart';
import '../../../../core/common/widgets/buttons/primary_button.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/no_internet_body_widget.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key, required this.onPressed});

  final Future<void> Function() onPressed;

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool _isChecking = false;

  Future<void> _handleTryAgain() async {
    setState(() => _isChecking = true);

    await widget.onPressed();

    if (mounted) {
      setState(() => _isChecking = false);
    }
  }

  void _onButtonPressed() {
    _handleTryAgain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BGWidget(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: NoInternetBodyWidget(
                      firstTitle: context.locale!.speedy.toUpperCase(),
                      secondTitle: context.locale!.approvals.toUpperCase(),
                      slogan: context.locale!.sloganFirst,
                      centerRightIcon: Assets.elements.fluyingDol.image(
                        fit: BoxFit.cover,
                      ),
                      centerIcon: Assets.elements.portrait.image(
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                PrimaryButton(
                  onPressed: _isChecking ? () {} : _onButtonPressed,
                  child: _isChecking
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.black,
                          ),
                        )
                      : Text(context.locale!.tryAgain.toUpperCase()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
