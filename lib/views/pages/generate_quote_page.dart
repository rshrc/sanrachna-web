//import 'dart:async';
//import 'dart:io';
//import 'dart:typed_data';
//
//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:open_file/open_file.dart';
////import 'package:path_provider/path_provider.dart';
//import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pw;
//import 'package:printing/printing.dart';
//import 'package:sanrachna_web/providers/oq_provider.dart';
//import 'package:url_launcher/url_launcher.dart' as ul;
//
//class GenerateQuotePage extends StatefulWidget {
//  @override
//  GenerateQuotePageState createState() {
//    return GenerateQuotePageState();
//  }
//}
//
//class GenerateQuotePageState extends State<GenerateQuotePage>
//    with SingleTickerProviderStateMixin {
//  PrintingInfo printingInfo;
//
//  @override
//  void initState() {
//    super.initState();
//    _init();
//  }
//
//  Future<void> _init() async {
//    final PrintingInfo info = await Printing.info();
//
//    setState(() {
//      printingInfo = info;
//    });
//  }
//
//  void _showPrintedToast(BuildContext context) {
//    final ScaffoldState scaffold = Scaffold.of(context);
//
//    scaffold.showSnackBar(
//      const SnackBar(
//        content: Text('Document printed successfully'),
//      ),
//    );
//  }
//
//  void _showSharedToast(BuildContext context) {
//    final ScaffoldState scaffold = Scaffold.of(context);
//
//    scaffold.showSnackBar(
//      const SnackBar(
//        content: Text('Document shared successfully'),
//      ),
//    );
//  }
//
//  Future<void> _saveAsFile(
//    BuildContext context,
//    LayoutCallback build,
//    PdfPageFormat pageFormat,
//  ) async {
//    final Uint8List bytes = await build(pageFormat);
//
//    // todo:
////    final Directory appDocDir = await getApplicationDocumentsDirectory();
////    final String appDocPath = appDocDir.path;
////    final File file = File(appDocPath + '/' + 'document.pdf');
////    print('Save as file ${file.path} ...');
////    await file.writeAsBytes(bytes);
////    OpenFile.open(file.path);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    pw.RichText.debug = true;
//
//    final actions = <PdfPreviewAction>[
//      if (!kIsWeb)
//        PdfPreviewAction(
//          icon: const Icon(Icons.save),
//          onPressed: _saveAsFile,
//        )
//    ];
//
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Pdf Printing Example'),
//      ),
//      body: PdfPreview(
//        maxPageWidth: 700,
//        build: generateDocument,
//        actions: actions,
//        onPrinted: _showPrintedToast,
//        onShared: _showSharedToast,
//      ),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.deepOrange,
//        onPressed: _showSources,
//        child: Icon(Icons.code),
//      ),
//    );
//  }
//
//  void _showSources() {
//    ul.launch(
//      'https://github.com/DavBfr/dart_pdf/blob/master/demo/lib/',
//    );
//  }
//}
