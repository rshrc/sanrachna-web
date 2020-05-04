import 'package:flutter/material.dart';

class AssociatePage extends StatefulWidget {
  @override
  _AssociatePageState createState() => _AssociatePageState();
}

class _AssociatePageState extends State<AssociatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Associate Data Goes Here"),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Add Associate")),
    );
  }
}
