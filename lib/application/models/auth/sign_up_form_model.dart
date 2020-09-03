import 'package:forsat/application/classes/errors/common_error.dart';
import 'package:forsat/application/state/auth_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpFormModel {
  final AuthState _authState = Injector.get<AuthState>();
  String firstName;
  String lastName;
  String address;
  String phoneNumber;
  String schoolName;
  String parentName;
  String parentPhoneNumber;
  int programId;
  int courseId;
  String email;
  String password;
  String passwordConfirmation;
  String profilePicture;

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  void setAddress(String address) {
    this.address = address;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setSchoolName(String schoolName) {
    this.schoolName = schoolName;
  }

  void setParentName(String parentName) {
    this.parentName = parentName;
  }

  void setParentPhoneNumber(String parentPhoneNumber) {
    this.parentPhoneNumber = parentPhoneNumber;
  }

  void setProgramId(int programId) {
    this.programId = programId;
  }

  void setCourseId(int courseId) {
    this.courseId = courseId;
  }

  void setProfilePicture(String profilePicture) {
    if (profilePicture == null) {
      this.profilePicture = "http://www.fb.com";
    } else {
      this.profilePicture = profilePicture;
    }
  }

  void setEmail(String email) {
    //email validation
    if (!validateEmail(email)) {
      throw CommonError(message: "Invalid Email");
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

  void setPasswordConfirmation(String passwordConfirmation) {
    if (this.password != passwordConfirmation) {
      throw CommonError(message: "Password do not match");
    }
    this.passwordConfirmation = passwordConfirmation;
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length >= 6 &&
        this.validateEmail(this.email);
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }

  submitSignUp() async {
    await _authState.signUp(
        firstName: this.firstName,
        lastName: this.lastName,
        address: this.address,
        phoneNumber: this.phoneNumber,
        schoolName: this.schoolName,
        parentName: this.parentName,
        parentPhoneNumber: this.parentPhoneNumber,
        programId: this.programId,
        courseId: this.courseId,
        email: this.email,
        password: this.password,
        passwordConfirmation: this.passwordConfirmation,
        profilePicture: this.profilePicture);
  }
}
