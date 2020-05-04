import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/providers/prospect_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';

class ProspectPage extends StatefulWidget {
  @override
  _ProspectPageState createState() => _ProspectPageState();
}

class _ProspectPageState extends State<ProspectPage> {
  bool _dialVisible = true;

  List<ProspectModel> _prospectList = [];

  ProspectProvider _prospectProvider = ProspectProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<Object>(
                  future: _prospectProvider.getProspects(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print("Line 40: ${snapshot.data}");

                    _prospectList = snapshot.data;

                    return Column(
                      children: [
                        TitleWidget(title: "Labour"),
                        DataTable(
                          columns: [
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Organization')),
                          ],
                          rows: _prospectList
                              .map((element) => DataRow(cells: <DataCell>[
                            DataCell(Text("${element.email}")),
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
          tooltip: 'Add Prospect',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                label: 'Add Prospect',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('FIRST CHILD')),
          ],
        ));
  }
}
