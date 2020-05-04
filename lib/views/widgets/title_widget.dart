import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {

  String title;

  TitleWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.16,
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(16.0)),
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20.0),),
        ),
      ),
    );
  }
}
