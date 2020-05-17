part of 'prefs_bloc.dart';

abstract class PrefsEvent extends Equatable {
  const PrefsEvent();
}

class LoginEvent extends PrefsEvent {
  final String pin;

  LoginEvent(this.pin);

  @override
  List<Object> get props => [pin];
}

class GetPinEvent extends PrefsEvent {
  @override
  List<Object> get props => [];
}

class LogoutEvent extends PrefsEvent {
  @override
  List<Object> get props => [];
}
