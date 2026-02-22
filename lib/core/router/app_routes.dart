enum AppRoutes {
  main(path: '/'),
  hiddenForm(path: '/hiddenForm'),
  noInternet(path: '/noInternet'),
  onboarding(path: '/onboarding'),
  splash(path: '/splash');

  final String path;

  const AppRoutes({required this.path});
}
