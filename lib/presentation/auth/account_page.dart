import 'package:flutter/material.dart';
import 'package:forsat/application/models/auth/sign_out_model.dart';
import 'package:forsat/router/route_constants.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Page"),
      ),
      body: Injector(
          inject: [Inject<SignOutModel>(() => SignOutModel())],
          builder: (context) {
            final _singletonSignOutModel = RM.get<SignOutModel>();
            return StateBuilder(
              observe: () => _singletonSignOutModel,
              builder: (context, model) {
                return Container(
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {
                        _singletonSignOutModel.setState((signOutState) async {
                          await signOutState.submitSignOut();
                          Navigator.popAndPushNamed(context, signInRoute);
                        });
                      },
                      height: 55.0,
                      shape: StadiumBorder(),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Sign Out",
                        style:
                            TextStyle(color: Colors.grey[100], fontSize: 30.0),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
