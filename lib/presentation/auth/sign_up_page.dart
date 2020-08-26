import 'package:flutter/material.dart';
import 'package:forsat/application/models/auth/sign_up_form_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:forsat/values/images.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
            builder: (context) {
              final _singletonSignUpFormModel =
                  Injector.getAsReactive<SignUpFormModel>();
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
                    StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String firstName) {
                            signUpFormModel.setState(
                                (state) => state.setFirstName(firstName),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.person),
                              hintText: "First name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        );
                      },
                    ),
                    buildSizedBox(15.0),
                    StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String lastName) {
                            signUpFormModel.setState(
                                (state) => state.setLastName(lastName),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.person),
                              hintText: "Last Name",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        );
                      },
                    ),
                    buildSizedBox(15.0),
                    StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String email) {
                            signUpFormModel.setState(
                                (state) => state.setEmail(email),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.email),
                              hintText: "Enter Your Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        );
                      },
                    ),
                    buildSizedBox(15.0),
                    StateBuilder<SignUpFormModel>(
                      builder: (_, signUpFormModel) {
                        return TextFormField(
                          onChanged: (String password) {
                            signUpFormModel.setState(
                                (state) => state.setPassword(password),
                                catchError: true);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
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
                      observe: () => _singletonSignUpFormModel,
                      builder: (context, model) {
                        return MaterialButton(
                          onPressed: () {
                            if (!_singletonSignUpFormModel.state
                                .validateData()) {
                              _key.currentState.showSnackBar(SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Data is Invalid")));
                            }
                          },
                          height: 55.0,
                          shape: StadiumBorder(),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Sign Up",
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
                        Text("Already have an Account"),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, signInRoute);
                            },
                            child: Text(
                              "Sign In",
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
