import 'package:flutter/material.dart';

class ClientalePage extends StatefulWidget {
  @override
  _ClientalePageState createState() => _ClientalePageState();
}

class _ClientalePageState extends State<ClientalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Clientale Data Goes Here"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text("Add Clientale")),
    );
  }
}
