import 'package:forsat/application/classes/errors/common_error.dart';

class SignUpFormModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

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
