import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/providers/material_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';


class MaterialPage extends StatefulWidget {
  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  bool _dialVisible = true;

  List<MaterialModel> _tiles = [];
  List<MaterialModel> _civil = [];
  List<MaterialModel> _electric = [];
  List<MaterialModel> _plumbing = [];
  List<MaterialModel> _paint = [];
  List<MaterialModel> _ply = [];

  MaterialProvider _materialProvider = MaterialProvider();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50.0,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<Object>(
                  future: _materialProvider.getCivil(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print("Line 40: ${snapshot.data}");

                    _civil = snapshot.data;

                    return Column(
                      children: [
                        TitleWidget(title: "Civil"),
                        DataTable(
                          columns: [
                            DataColumn(label: Text('Particulars')),
                            DataColumn(label: Text('Rate')),
                            DataColumn(label: Text('Unit')),
                            DataColumn(label: Text('Quantity')),
                            DataColumn(label: Text('Prospect')),

                          ],
                          rows: _civil
                              .map((element) => DataRow(cells: <DataCell>[
                            //Extracting from Map element the value
                            DataCell(Text("${element.particulars}")),
                            DataCell(Text("${element.rate}")),
                            DataCell(Text("${element.unit}")),
                            DataCell(Text("${element.quantity}")),
                            DataCell(Text("${element.prospect}")),

                          ]))
                              .toList(),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(height: 50.0,),
            FutureBuilder<Object>(
                future: _materialProvider.getElectric(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 74: ${snapshot.data}");

                  _electric = snapshot.data;

                  if(_electric.length == 0) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }

                  return Column(
                    children: [
                      TitleWidget(title: "Electric"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Particulars')),
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Prospect')),

                        ],
                        rows: _electric
                            .map((element) => DataRow(cells: <DataCell>[
                          //Extracting from Map element the value
                          DataCell(Text("${element.particulars}")),
                          DataCell(Text("${element.rate}")),
                          DataCell(Text("${element.unit}")),
                          DataCell(Text("${element.quantity}")),
                          DataCell(Text("${element.prospect}")),

                        ]))
                            .toList(),
                      ),
                    ],
                  );
                }),
            SizedBox(height: 50.0,),
            FutureBuilder<Object>(
                future: _materialProvider.getPaint(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 74: ${snapshot.data}");

                  _paint = snapshot.data;

                  if(_paint.length == 0) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }

                  return Column(
                    children: [
                      TitleWidget(title: "Paint"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Particulars')),
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Prospect')),

                        ],
                        rows: _paint
                            .map((element) => DataRow(cells: <DataCell>[
                          //Extracting from Map element the value
                          DataCell(Text("${element.particulars}")),
                          DataCell(Text("${element.rate}")),
                          DataCell(Text("${element.unit}")),
                          DataCell(Text("${element.quantity}")),
                          DataCell(Text("${element.prospect}")),

                        ]))
                            .toList(),
                      ),
                    ],
                  );
                }),
            SizedBox(height: 50.0,),
            FutureBuilder<Object>(
                future: _materialProvider.getTiles(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 74: ${snapshot.data}");

                  _tiles = snapshot.data;

                  if(_tiles.length == 0) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }

                  return Column(
                    children: [
                      TitleWidget(title: "Tiles"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Particulars')),
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Prospect')),

                        ],
                        rows: _tiles
                            .map((element) => DataRow(cells: <DataCell>[
                          //Extracting from Map element the value
                          DataCell(Text("${element.particulars}")),
                          DataCell(Text("${element.rate}")),
                          DataCell(Text("${element.unit}")),
                          DataCell(Text("${element.quantity}")),
                          DataCell(Text("${element.prospect}")),

                        ]))
                            .toList(),
                      ),
                    ],
                  );
                }),
            SizedBox(height: 50.0,),
            FutureBuilder<Object>(
                future: _materialProvider.getPlumbing(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 74: ${snapshot.data}");

                  _plumbing = snapshot.data;

                  if(_plumbing.length == 0) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }

                  return Column(
                    children: [
                      TitleWidget(title: "Plumbing"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Particulars')),
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Prospect')),

                        ],
                        rows: _plumbing
                            .map((element) => DataRow(cells: <DataCell>[
                          //Extracting from Map element the value
                          DataCell(Text("${element.particulars}")),
                          DataCell(Text("${element.rate}")),
                          DataCell(Text("${element.unit}")),
                          DataCell(Text("${element.quantity}")),
                          DataCell(Text("${element.prospect}")),

                        ]))
                            .toList(),
                      ),
                    ],
                  );
                }),
            SizedBox(height: 50.0,),
            FutureBuilder<Object>(
                future: _materialProvider.getPly(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 74: ${snapshot.data}");

                  _ply = snapshot.data;

                  if(_ply.length == 0) {
                    return Center(
                      child: Text("No Data"),
                    );
                  }

                  return Column(
                    children: [
                      TitleWidget(title: "Ply"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Particulars')),
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Prospect')),

                        ],
                        rows: _ply
                            .map((element) => DataRow(cells: <DataCell>[
                          //Extracting from Map element the value
                          DataCell(Text("${element.particulars}")),
                          DataCell(Text("${element.rate}")),
                          DataCell(Text("${element.unit}")),
                          DataCell(Text("${element.quantity}")),
                          DataCell(Text("${element.prospect}")),

                        ]))
                            .toList(),
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        visible: _dialVisible,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Add Database',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              label: 'Add Material',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD')),
          SpeedDialChild(
            child: Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Add Service',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
        ],
      ),
    );
  }
}
