part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class SaveRegisterEvent extends RegisterEvent {
  final RegisterRequest request;

  SaveRegisterEvent({required this.request});
}


