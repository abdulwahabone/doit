import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:doit/provider/LoginProvider.dart';
import 'package:doit/provider/dashboardProvider.dart';
import 'package:doit/theme/customTheme.dart';
import 'package:doit/utils/sharedPrefs.dart';
import 'package:doit/screens/dashboard.dart';
import 'package:doit/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: DashboardProvider()),
      ],
      child: Consumer<LoginProvider>(
        builder: (ctx, setupProvider, _) => MaterialApp(
          theme: CustomTheme.lightTheme,
          home: setupProvider.isUserAuthenticated ? Dashboard() : Login(),
          routes: {
            '/dashboard': (ctx) => Dashboard(),
            '/login': (ctx) => Login(),
          },
        ),
      ),
    );
  }
}
