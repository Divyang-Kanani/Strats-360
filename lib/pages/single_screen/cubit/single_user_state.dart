import 'package:strats_360/pages/single_screen/model/single_user_model_entity.dart';

abstract class SingleUserState {}

class SingleUserInitialState extends SingleUserState {}

class SingleUserLoadingState extends SingleUserState {}

class SingleUserSuccessState extends SingleUserState {
  final SingleUserModelEntity modelEntity;

  SingleUserSuccessState({required this.modelEntity});
}

class SingleUserExceptionState extends SingleUserState {
  final String errorMessage;

  SingleUserExceptionState({required this.errorMessage});
}
