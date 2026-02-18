import 'package:flutter/material.dart';

import 'features/main/screens/main_screen.dart';

class BoostaApp extends StatelessWidget {
  const BoostaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Boosta test project', home: const MainScreen());
  }
}
