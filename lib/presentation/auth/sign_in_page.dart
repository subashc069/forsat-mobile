import 'package:flutter/material.dart';
import 'package:forsat/application/models/auth/sign_in_form_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/values/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   brightness: Brightness.light,
        //   automaticallyImplyLeading: false,
        // ),
        body: Injector(
            inject: [Inject<SignInFormModel>(() => SignInFormModel())],
            builder: (context) {
              final _singletonSignInFormModel =
                  Injector.getAsReactive<SignInFormModel>();
              return Container(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 250.0,
                      child: Center(
                        child: Image.asset(Images.logo),
                      ),
                    ),
                    StateBuilder<SignInFormModel>(
                      builder: (context, signInFormModel) {
                        return TextFormField(
                          onChanged: (String email) {
                            signInFormModel.setState(
                                (state) => state.setEmail(email),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signInFormModel.hasError
                                  ? signInFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.email),
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        );
                      },
                    ),
                    buildSizedBox(15.0),
                    StateBuilder<SignInFormModel>(
                      builder: (_, signInFormModel) {
                        return TextFormField(
                          onChanged: (String password) {
                            signInFormModel.setState(
                                (state) => state.setPassword(password),
                                catchError: true);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              errorText: signInFormModel.hasError
                                  ? signInFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        );
                      },
                    ),
                    buildSizedBox(25.0),
                    StateBuilder(
                      observe: () => _singletonSignInFormModel,
                      builder: (context, model) {
                        return MaterialButton(
                          onPressed: () {
                            if (!_singletonSignInFormModel.state
                                .validateData()) {
                              _key.currentState.showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Data is Invalid")));
                            } else {
                              _singletonSignInFormModel.setState(
                                  (signInFormState) =>
                                      signInFormState.submitSignIn());
                            }
                          },
                          height: 55.0,
                          shape: StadiumBorder(),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.grey[100], fontSize: 30.0),
                          ),
                        );
                      },
                    ),
                    buildSizedBox(20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("Don't have an Account ?"),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, signUpRoute);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              );
            }));
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}
