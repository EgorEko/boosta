enum AppRoutes {
  main(path: '/'),
  hiddenForm(path: '/hiddenForm'),
  noInternet(path: '/noInternet'),
  onboarding(path: '/onboarding'),
  privacyPolicy(path: '/privacyPolicy'),
  splash(path: '/splash'),
  termsOfService(path: '/termsOfService');

  final String path;

  const AppRoutes({required this.path});
}
