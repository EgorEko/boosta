import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'boosta_app.dart';
import 'core/common/providers/global_bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(GlobalBlocProvider(prefs: prefs, child: const BoostaApp()));
}
