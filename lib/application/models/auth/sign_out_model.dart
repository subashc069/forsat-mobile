import 'package:forsat/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignOutModel {
  final AuthState _authState = Injector.get<AuthState>();

  submitSignOut() async {
    await _authState.signOut();
  }
}
