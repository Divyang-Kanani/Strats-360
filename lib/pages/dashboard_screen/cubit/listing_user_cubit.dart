import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strats_360/api/api_service.dart';
import 'package:strats_360/exception/server_exception.dart';
import 'package:strats_360/pages/dashboard_screen/cubit/listing_user_state.dart';

class ListingUserCubit extends Cubit<ListingUserState> {
  ListingUserCubit() : super(ListingInitialState()) {
    Future.delayed(
      Duration(milliseconds: 100),
      () async {
        await callApi();
      },
    );
  }

  Future<void> callApi() async {
    try {
      emit(ListingLoadingState());
      final apiResponse =
          await ApiService().apiRestClient.getUserListing(page: 2);
      emit(ListingSuccessState(entityList: apiResponse.data ?? []));
    } catch (exception) {
      if (exception is DioException) {
        emit(ListingExceptionState(
            errorMessage: ServerException.withError(exception: exception)
                .getErrorMessage));
      } else {
        emit(ListingExceptionState(errorMessage: "Something went wrong"));
      }
    }
  }
}
