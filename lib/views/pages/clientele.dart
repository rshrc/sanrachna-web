import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/providers/clientele_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';


class ClientalePage extends StatefulWidget {
  @override
  _ClientalePageState createState() => _ClientalePageState();
}

class _ClientalePageState extends State<ClientalePage> {
  bool _dialVisible = true;
  List<ClienteleModel> _clientList = [];
  List<ClienteleModel> _leadList = [];
  List<ClienteleModel> _prospectList = [];

  ClienteleProvider _clienteleProvider = ClienteleProvider();

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
                    future: _clienteleProvider.getClients(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      print("Line 40: ${snapshot.data}");

                      _clientList = snapshot.data;

                      return Column(
                        children: [
                          TitleWidget(title: "Clients"),
                          DataTable(
                            columns: [
                              DataColumn(label: Text('Full Name')),
                              DataColumn(label: Text('Organization')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Mobile')),
                              DataColumn(label: Text('Site Type')),
                              DataColumn(label: Text('Source Type')),

                            ],
                            rows: _clientList
                                .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(Text("${element.siteType}")),
                              DataCell(Text("${element.sourceType}")),

                            ]))
                                .toList(),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 50.0,),
              FutureBuilder<Object>(
                  future: _clienteleProvider.getLeads(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print("Line 74: ${snapshot.data}");

                    _leadList = snapshot.data;

                    if(_leadList.length == 0) {
                      return Center(
                        child: Text("No Data"),
                      );
                    }

                    return Column(
                      children: [
                        TitleWidget(title: "Leads"),
                        DataTable(
                          columns: [
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Organization')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Mobile')),
                            DataColumn(label: Text('Site Type')),
                            DataColumn(label: Text('Source Type')),

                          ],
                          rows: _leadList
                              .map((element) => DataRow(cells: <DataCell>[
                            //Extracting from Map element the value
                            DataCell(Text("${element.fullName}")),
                            DataCell(Text("${element.organization}")),
                            DataCell(Text("${element.email}")),
                            DataCell(Text("${element.mobileNumber}")),
                            DataCell(Text("${element.siteType}")),
                            DataCell(Text("${element.sourceType}")),

                          ]))
                              .toList(),
                        ),
                      ],
                    );
                  }),
              SizedBox(height: 50.0,),
              FutureBuilder<Object>(
                  future: _clienteleProvider.getProspects(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print("Line 74: ${snapshot.data}");

                    _prospectList = snapshot.data;

                    if(_prospectList.length == 0) {
                      return Center(
                        child: Text("No Data"),
                      );
                    }

                    return Column(
                      children: [
                        TitleWidget(title: "Prospects"),
                        DataTable(
                          columns: [
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Organization')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Mobile')),
                            DataColumn(label: Text('Site Type')),
                            DataColumn(label: Text('Source Type')),

                          ],
                          rows: _prospectList
                              .map((element) => DataRow(cells: <DataCell>[
                            //Extracting from Map element the value
                            DataCell(Text("${element.fullName}")),
                            DataCell(Text("${element.organization}")),
                            DataCell(Text("${element.email}")),
                            DataCell(Text("${element.mobileNumber}")),
                            DataCell(Text("${element.siteType}")),
                            DataCell(Text("${element.sourceType}")),

                          ]))
                              .toList(),
                        ),
                      ],
                    );
                  }),
              SizedBox(height: 50.0,),
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
          tooltip: 'Add Clientele',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                label: 'Add Client',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('FIRST CHILD')),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Add Leads',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'Add Prospects',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('THIRD CHILD'),
            ),
          ],
        ));
  }
}