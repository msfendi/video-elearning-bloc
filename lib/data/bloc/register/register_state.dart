part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoadingState extends RegisterState {}

class LoadedState extends RegisterState {
  final RegisterResponse response;

  LoadedState({
    required this.response,
  });
}