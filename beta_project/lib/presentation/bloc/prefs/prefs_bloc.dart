import 'dart:async';

import 'package:beta_project/core/globals.dart';
import 'package:beta_project/core/injection/service_locator.dart';
import 'package:beta_project/presentation/bloc/global_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'prefs_event.dart';

/// Bloc implementation for [SharedPreferences]
class PrefsBloc extends Bloc<PrefsEvent, GlobalState> {
  SharedPreferences _prefs;

  // Constructor
  PrefsBloc() {
    sl.getAsync<SharedPreferences>().then((value) => _prefs = value);
  }

  @override
  GlobalState get initialState => InitialState();

  @override
  Stream<GlobalState> mapEventToState(
    PrefsEvent event,
  ) async* {
    yield LoadingState(true);

    if (event is LoginEvent) {
      // Get the user's pin
      await _prefs.setString(kPrefsKey, event.pin);
      yield LoadingState(false);
      yield SuccessState(null);
    } else if (event is LogoutEvent) {
      await _prefs.clear();
      yield LoadingState(false);
      yield SuccessState(null);
    } else if (event is GetPinEvent) {
      final pin = _prefs?.getString(kPrefsKey);
      print("Prefs pin -> $pin");
      yield LoadingState(false);
      if (pin == null || pin.isEmpty)
        yield ErrorState("No PIN found for user");
      else
        yield SuccessState<String>(pin);
    }
  }
}
