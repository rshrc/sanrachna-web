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

  final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];

  var logger = Logger();

  AssociateProvider _associateProvider = AssociateProvider();

  List<AssociateModel> _labourList = [];

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

                if(!snapshot.hasData) {
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
                      rows: _labourList.map((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text("${element.id}")), //Extracting from Map element the value
                          DataCell(Text("${element.fullName}")),
                          DataCell(Text("${element.organization}")),
                        ]
                      )).toList(),
                    ),
                  ],
                );
              }
            ),
          ),
          Column(
            children: [
              TitleWidget(title: "Supervisor"),
              DataTable(
                columns: [
                  DataColumn(label: Text('RollNo')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Class')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Arya')),
                    DataCell(Text('6')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('12')),
                    DataCell(Text('John')),
                    DataCell(Text('9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('42')),
                    DataCell(Text('Tony')),
                    DataCell(Text('8')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Arya')),
                    DataCell(Text('6')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('12')),
                    DataCell(Text('John')),
                    DataCell(Text('9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('42')),
                    DataCell(Text('Tony')),
                    DataCell(Text('8')),
                  ]),
                ],
              )
            ],
          ),
          Column(
            children: [
              TitleWidget(title: "Vendor"),
              DataTable(
                columns: [
                  DataColumn(label: Text('RollNo')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Class')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Arya')),
                    DataCell(Text('6')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('12')),
                    DataCell(Text('John')),
                    DataCell(Text('9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('42')),
                    DataCell(Text('Tony')),
                    DataCell(Text('8')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('Arya')),
                    DataCell(Text('6')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('12')),
                    DataCell(Text('John')),
                    DataCell(Text('9')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('42')),
                    DataCell(Text('Tony')),
                    DataCell(Text('8')),
                  ]),
                ],
              )
            ],
          ),
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
