import 'package:flutter/material.dart';
import 'package:sanrachna_web/views/pages/associate.dart';
import 'package:sanrachna_web/views/pages/clientele.dart';
import 'package:sanrachna_web/views/pages/material.dart';
import 'package:sanrachna_web/views/pages/prospect.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent, indicatorColor: Colors.yellow,splashColor: Colors.yellow),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
             // labelStyle: GoogleFonts.exo2(fontSize: 32.0, color: Colors.white),
              tabs: [
                Tab(text: "Associate",),
                Tab(text: "Clientele"),
                Tab(text: "Material",),
                Tab(text: "Prospect",),
              ],
            ),
            title: Text('Sanrachna',
               // style: GoogleFonts.pacifico(fontSize: 40.0)
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AssociatePage(),
              ClientalePage(),
              MaterialPage(),
              ProspectPage(),
            ],
          ),
        ),
      ),
    );
  }
}
