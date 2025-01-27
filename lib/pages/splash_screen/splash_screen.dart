import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strats_360/navigation/app_nav_path_name.dart';
import 'package:strats_360/pages/splash_screen/cubit/splash_cubit.dart';
import 'package:strats_360/pages/splash_screen/cubit/splash_state.dart';

class SplashScreen extends StatelessWidget {
  static Widget create() => BlocProvider(
        create: (_) => SplashCubit()..navigateToDashboardScreen(),
        child: SplashScreen(),
      );

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocListener<SplashCubit, SplashState>(
        listener: (_, state) {
          if (state == SplashState.dashboardScreen) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppNavPathName.dashboardScreenPath,
              (route) => false,
            );
          }
        },
        child: PopScope(
          canPop: false,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
