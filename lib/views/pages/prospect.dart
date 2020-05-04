import 'package:flutter/material.dart';

class ProspectPage extends StatefulWidget {
  @override
  _ProspectPageState createState() => _ProspectPageState();
}

class _ProspectPageState extends State<ProspectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Prospect Data Goes Here"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text("Add Prospect")),
    );
  }
}
