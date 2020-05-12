import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sanrachna_web/views/pages/associate.dart';
import 'package:sanrachna_web/views/pages/clientele.dart';
import 'package:sanrachna_web/views/pages/material.dart';
import 'package:sanrachna_web/views/pages/quotation_page.dart';
import 'package:sanrachna_web/views/pages/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatefulWidget {
  @override
  _SanrachnaState createState() => _SanrachnaState();
}

class _SanrachnaState extends State<Sanrachna> {
  final pdf = pw.Document();

  Future savePdf() async {
    print("Called savePdf Method");
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;

    print("Document path $documentPath");

    File file = File("$documentPath/quotation.pdf");

    print("Save as file ${file.path}");

    await file.writeAsBytes(pdf.save());
  }

  writeOnPdf() {
    print("Writing to pdf");
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
              level: 0,
              child: pw.Text("Quotation"),
            ),
            pw.Paragraph(
              text: "Testing quotation document",
            ),
          ];
        }));
    print("Completed Writing");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          indicatorColor: Colors.yellow,
          splashColor: Colors.yellow),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              // labelStyle: GoogleFonts.exo2(fontSize: 32.0, color: Colors.white),
              tabs: [
                Tab(text: "Associate"),
                Tab(text: "Clientele"),
                Tab(text: "Material"),
                Tab(text: "Service"),
              ],
            ),
            title:
                Text('Sanrachna', style: GoogleFonts.pacifico(fontSize: 40.0)),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return QuotationPage();
                  }));
                },
                icon: Icon(Icons.picture_as_pdf),
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
            ],
          ),
        ),
      ),
    );
  }
}
