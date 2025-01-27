import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strats_360/api/api_service.dart';
import 'package:strats_360/exception/server_exception.dart';
import 'package:strats_360/pages/single_screen/cubit/single_user_state.dart';

class SingleUserCubit extends Cubit<SingleUserState> {
  SingleUserCubit({required int userId}) : super(SingleUserInitialState()) {
    Future.delayed(
      Duration(milliseconds: 100),
      () {
        callApi(userId: userId);
      },
    );
  }

  Future<void> callApi({required int userId}) async {
    try {
      emit(SingleUserLoadingState());
      final apiResponse =
          await ApiService().apiRestClient.getUserFromId(id: userId);
      emit(SingleUserSuccessState(modelEntity: apiResponse));
    } catch (exception) {
      if (exception is DioException) {
        emit(SingleUserExceptionState(
            errorMessage: ServerException.withError(exception: exception)
                .getErrorMessage));
      } else {
        emit(SingleUserExceptionState(errorMessage: "Something went wrong"));
      }
    }
  }
}
