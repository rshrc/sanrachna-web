import 'package:flutter/material.dart';

class DatabasePage extends StatefulWidget {
  @override
  _DatabasePageState createState() => _DatabasePageState();
}


class _DatabasePageState extends State<DatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Database Data Goes Here"),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: Text("Add Database")),
    );
  }
}
