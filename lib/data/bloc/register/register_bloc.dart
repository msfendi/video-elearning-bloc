import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:video_elearning/data/model/request/RegisterRequest.dart';
import 'package:video_elearning/data/model/responses/RegisterResponse.dart';
import 'package:video_elearning/data/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;
  RegisterBloc({required this.authService}) : super(RegisterInitial())  {
    on<SaveRegisterEvent>((event, emit) async {
      emit(LoadingState());
      final result = await authService.register(event.request);
      emit(LoadedState(response: result));
    });
  }
}
