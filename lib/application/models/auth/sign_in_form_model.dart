import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInFormModel {
  final AuthState _authState = Injector.get<AuthState>();
  String email;
  String password;

  void setEmail(String email) {
    //email validation
    if (!validateEmail(email)) {
      throw CommonError(message: "Invalid Message");
    }
    this.email = email;
  }

  void setPassword(String password) {
    //email validation
    if (password.length < 6) {
      throw CommonError(
          message: "password length must be greater  than 6 characters");
    }
    this.password = password;
  }

  Future<void> submitSignIn() async {
    return await _authState.signIn(email: this.email, password: this.password);
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(this.email);
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }
}
