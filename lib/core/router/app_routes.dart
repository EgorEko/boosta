enum AppRoutes {
  main(path: '/'),
  onboarding(path: '/onboarding'),
  splash(path: '/splash');

  final String path;

  const AppRoutes({required this.path});
}
