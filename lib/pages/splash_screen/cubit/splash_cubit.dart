import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strats_360/pages/splash_screen/cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.splashScreen);

  void navigateToDashboardScreen() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        if (!isClosed) {
          emit(SplashState.dashboardScreen);
        }
      },
    );
  }
}
