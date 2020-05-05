import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Text(title,
              style: GoogleFonts.exo2(fontSize: 26.0, color: Colors.white)
          ),
        ),
      ),
    );
  }
}
