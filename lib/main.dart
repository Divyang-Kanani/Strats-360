import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:strats_360/firebase_options.dart';
import 'package:strats_360/navigation/app_nav_path_name.dart';
import 'package:strats_360/navigation/app_navigation_service.dart';
import 'package:strats_360/utils/theme/app_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strats-360',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appThemeData,
      initialRoute: AppNavPathName.splashScreenPath,
      onGenerateRoute: AppNavigationService.generatedRoutes,
      navigatorKey: navigatorKey,
    );
  }
}
