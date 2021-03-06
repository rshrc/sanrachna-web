import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {

  String title;
  double fontSize;

  TitleWidget({this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(16.0)),
        child: Center(
          child: Text("  " + title + "  ",
              style: GoogleFonts.exo2(fontSize: fontSize ?? 26.0, color: Colors.white)
          ),
        ),
      ),
    );
  }
}
