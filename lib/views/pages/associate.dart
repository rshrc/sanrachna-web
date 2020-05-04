import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/providers/associate_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:logger/logger.dart';

class AssociatePage extends StatefulWidget {
  @override
  _AssociatePageState createState() => _AssociatePageState();
}

class _AssociatePageState extends State<AssociatePage> {
  bool _dialVisible = true;

  AssociateProvider _associateProvider = AssociateProvider();

  List<AssociateModel> _labourList = [];
  List<AssociateModel> _supervisorList = [];
  List<AssociateModel> _vendorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<Object>(
                future: _associateProvider.getLabours(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  print("Line 40: ${snapshot.data}");

                  _labourList = snapshot.data;

                  return Column(
                    children: [
                      TitleWidget(title: "Labour"),
                      DataTable(
                        columns: [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Full Name')),
                          DataColumn(label: Text('Organization')),
                        ],
                        rows: _labourList
                            .map((element) => DataRow(cells: <DataCell>[
                                  DataCell(Text("${element.id}")),
                                  //Extracting from Map element the value
                                  DataCell(Text("${element.fullName}")),
                                  DataCell(Text("${element.organization}")),
                                ]))
                            .toList(),
                      ),
                    ],
                  );
                }),
          ),
          FutureBuilder<Object>(
              future: _associateProvider.getSupervisors(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                print("Line 74: ${snapshot.data}");

                _supervisorList = snapshot.data;

                if(_supervisorList.length == 0) {
                  return Center(
                    child: Text("No Data"),
                  );
                }

                return Column(
                  children: [
                    TitleWidget(title: "Supervisor"),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Full Name')),
                        DataColumn(label: Text('Organization')),
                      ],
                      rows: _supervisorList
                          .map((element) => DataRow(cells: <DataCell>[
                                DataCell(Text("${element.id}")),
                                //Extracting from Map element the value
                                DataCell(Text("${element.fullName}")),
                                DataCell(Text("${element.organization}")),
                              ]))
                          .toList(),
                    ),
                  ],
                );
              }),
          FutureBuilder<Object>(
              future: _associateProvider.getVendors(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                print("Line 74: ${snapshot.data}");

                _vendorList = snapshot.data;

                if(_vendorList.length == 0) {
                  return Center(
                    child: Text("No Data"),
                  );
                }

                return Column(
                  children: [
                    TitleWidget(title: "Vendor"),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Full Name')),
                        DataColumn(label: Text('Organization')),
                      ],
                      rows: _vendorList
                          .map((element) => DataRow(cells: <DataCell>[
                        DataCell(Text("${element.id}")),
                        //Extracting from Map element the value
                        DataCell(Text("${element.fullName}")),
                        DataCell(Text("${element.organization}")),
                      ]))
                          .toList(),
                    ),
                  ],
                );
              }),
        ],
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
        tooltip: 'Add Associate',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.accessibility),
              backgroundColor: Colors.red,
              label: 'Add Labour',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('FIRST CHILD')),
          SpeedDialChild(
            child: Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Add Supervisor',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
          ),
          SpeedDialChild(
            child: Icon(Icons.keyboard_voice),
            backgroundColor: Colors.green,
            label: 'Add Vendor',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('THIRD CHILD'),
          ),
        ],
      ),
    );
  }
}
