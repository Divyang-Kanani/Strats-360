import 'package:strats_360/model/listing_response_model_entity.dart';

abstract class ListingUserState {}

class ListingInitialState extends ListingUserState {}

class ListingLoadingState extends ListingUserState {}

class ListingSuccessState extends ListingUserState {
  final List<ListingResponseModelData> entityList;

  ListingSuccessState({required this.entityList});
}

class ListingExceptionState extends ListingUserState {
  final String errorMessage;

  ListingExceptionState({required this.errorMessage});
}
