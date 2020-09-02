import 'package:flutter/material.dart';
import 'package:forsat/application/repositories/auth_repository.dart';

class AuthState {
  final AuthRepository _authRepository;
  AuthState(this._authRepository) : assert(_authRepository != null);

  Future signIn({@required String email, @required String password}) async {
    await _authRepository.signIn(email: email, password: password);
  }

  Future signUp(
      {@required String firstName,
      @required String lastName,
      @required String address,
      @required String phoneNumber,
      @required String schoolName,
      @required String parentName,
      @required String parentPhoneNumber,
      @required int programId,
      @required int courseId,
      @required String email,
      @required String password,
      @required String passwordConfirmation,
      String profilePicture}) async {
    await _authRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        address: address,
        phoneNumber: phoneNumber,
        schoolName: schoolName,
        parentName: parentName,
        parentPhoneNumber: parentPhoneNumber,
        programId: programId,
        courseId: courseId,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
        profilePicture: profilePicture);
  }

  Future signOut() async {
    await _authRepository.signOut();
  }
}
