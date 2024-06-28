import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/register_request_body.dart';
import '../data/repos/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(InitialState());

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(LoadingState());
    final requestBody = RegisterRequestBodyModel(
      name: name,
      email: email,
      password: password,
    );

    final response = await _registerRepo.registerUser(requestBody);

    response.fold(
      (errors) {
        emit(ErrorState(errors));
      },
      (successMsg) {
        emit(SuccessState(successMsg));
      },
    );
  }
}