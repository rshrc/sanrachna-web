import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sanrachna_web/providers/oq_provider.dart';
import 'package:sanrachna_web/views/pages/associate.dart';
import 'package:sanrachna_web/views/pages/clientele.dart';
import 'package:sanrachna_web/views/pages/generate_quote_page.dart';
import 'package:sanrachna_web/views/pages/material.dart';
import 'package:sanrachna_web/views/pages/prospect.dart';
import 'package:sanrachna_web/views/pages/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatefulWidget {
  @override
  _SanrachnaState createState() => _SanrachnaState();
}

class _SanrachnaState extends State<Sanrachna> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          indicatorColor: Colors.yellow,
          splashColor: Colors.yellow),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              // labelStyle: GoogleFonts.exo2(fontSize: 32.0, color: Colors.white),
              tabs: [
                Tab(
                  text: "Associate",
                ),
                Tab(text: "Clientele"),
                Tab(
                  text: "Material",
                ),
                Tab(text: "Service"),
                Tab(
                  text: "Prospect",
                ),
              ],
            ),
            title: Text(
              'Sanrachna',
               style: GoogleFonts.pacifico(fontSize: 40.0)
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  /// Null
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return GenerateQuotePage();
//                      },
//                    ),
//                  );
                },
                icon: Icon(Icons.data_usage),
              ),
            ],
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AssociatePage(),
              ClientalePage(),
              MaterialPage(),
              ServicePage(),
              ProspectPage(),
            ],
          ),
        ),
      ),
    );
  }
}
