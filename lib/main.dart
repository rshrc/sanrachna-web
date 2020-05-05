import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:sanrachna_web/providers/oq_provider.dart';
import 'package:sanrachna_web/views/pages/associate.dart';
import 'package:sanrachna_web/views/pages/clientele.dart';
import 'package:sanrachna_web/views/pages/material.dart';
import 'package:sanrachna_web/views/pages/prospect.dart';
import 'package:sanrachna_web/views/pages/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';


//import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatefulWidget {

  @override
  _SanrachnaState createState() => _SanrachnaState();
}

class _SanrachnaState extends State<Sanrachna> {
  PrintingInfo printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final PrintingInfo info = await Printing.info();

    setState(() {
      printingInfo = info;
    });
  }


  void _showPrintedToast(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);

    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Document printed successfully'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);

    scaffold.showSnackBar(
      const SnackBar(
        content: Text('Document shared successfully'),
      ),
    );
  }

  Future<void> _saveAsFile(
      BuildContext context,
      LayoutCallback build,
      PdfPageFormat pageFormat,
      ) async {
    final Uint8List bytes = await build(pageFormat);

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final File file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.redAccent, indicatorColor: Colors.yellow,splashColor: Colors.yellow),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
             // labelStyle: GoogleFonts.exo2(fontSize: 32.0, color: Colors.white),
              tabs: [
                Tab(text: "Associate",),
                Tab(text: "Clientele"),
                Tab(text: "Material",),
                Tab(text: "Service"),
                Tab(text: "Prospect",),
              ],
            ),
            title: Text('Sanrachna',
               // style: GoogleFonts.pacifico(fontSize: 40.0)
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  
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
