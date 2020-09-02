import 'package:flutter/material.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Opportunities"),
      ),
      body: Container(
        child: Center(
          child: Text("This is home page"),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
