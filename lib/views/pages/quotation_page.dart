import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:sanrachna_web/views/pages/generate_quotation.dart';
import 'package:open_file/open_file.dart';

class QuotationPage extends StatefulWidget {
  @override
  QuotationPageState createState() {
    return QuotationPageState();
  }
}

class QuotationPageState extends State<QuotationPage>
    with SingleTickerProviderStateMixin {
  List<Tab> _myTabs;
  List<LayoutCallback> _tabGen;
  List<String> _tabUrl;
  int _tab = 0;
  TabController _tabController;

  PrintingInfo printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final PrintingInfo info = await Printing.info();

    _myTabs = const <Tab>[
      Tab(text: 'Quotation'),
    ];

    _tabGen = const <LayoutCallback>[
      generateQuotation,
    ];

    _tabUrl = const <String>[
      'generate_quotation.dart',
    ];

    _tabController = TabController(
      vsync: this,
      length: _myTabs.length,
      initialIndex: _tab,
    );
    _tabController.addListener(() {
      setState(() {
        _tab = _tabController.index;
      });
    });

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
    pw.RichText.debug = true;

    if (_tabController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Quotation',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          tabs: _myTabs,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: PdfPreview(
        maxPageWidth: 300,
        build: _tabGen[_tab],
        // actions: actions,
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
        canChangePageFormat: false,
      ),
    );
  }
}
