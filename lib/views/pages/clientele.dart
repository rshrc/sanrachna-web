import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/providers/clientele_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';

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
                              DataColumn(label: Text("ID")),
                              DataColumn(label: Text('Full Name')),
                              DataColumn(label: Text('Organization')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Mobile')),
                              DataColumn(label: Text('Site Type')),
                              DataColumn(label: Text('Source Type')),
                              DataColumn(label: Text("Delete")),

                            ],
                            rows: _clientList
                                .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.id}")),
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(Text("${element.siteType}")),
                              DataCell(Text("${element.sourceType}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _clienteleProvider
                                      .deleteClient(element.id)
                                      .then((value) {
                                    Toast.show("Deleting Client ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show("Deleted Client ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                  });
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.grey,
                                ),
                              ))


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
                onTap: () {
                  _addClienaleDialog(context, clientele: 'client');
                }),
            SpeedDialChild(
              child: Icon(Icons.brush),
              backgroundColor: Colors.blue,
              label: 'Add Leads',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addClienaleDialog(context, clientele: 'lead');
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.keyboard_voice),
              backgroundColor: Colors.green,
              label: 'Add Prospects',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addClienaleDialog(context, clientele: 'prospect');
              },
            ),
          ],
        ));
  }


  _addClienaleDialog(context, {clientele}) async {
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _organizationController = TextEditingController();
    TextEditingController _mobileNumberController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _siteTypeController = TextEditingController();
    TextEditingController _sourceTypeController = TextEditingController();

    TextStyle _labelTextStyle = TextStyle(color: Colors.black);

    await showDialog<String>(
      context: context,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.3,
        child: AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Container(
            child: Column(
              children: <Widget>[
                Text("Add Labour"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _fullNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Full Name',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _organizationController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Organization',
                        hintText: 'Organization',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _mobileNumberController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: 'Mobile Number',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        hintText: 'Email ID',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _siteTypeController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Site Type',
                        hintText: 'Site Type',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _sourceTypeController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Source Type',
                        hintText: 'Source Type',
                        labelStyle: _labelTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  // add it
                  switch (clientele) {
                    case 'client':
                      _clienteleProvider
                          .addClient(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                        siteType: _siteTypeController.text,
                        sourceType: _sourceTypeController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Client ${_fullNameController.text}",
                          context,
                          backgroundColor: Colors.green,
                          duration: 3,
                          textColor: Colors.white,
                          border: Border.all(color: Colors.white),
                        );
                        setState(() {
                          // Update Future Builder
                        });
                      });
                      break;
                    case 'lead':
                      _clienteleProvider
                          .addLead(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                        siteType: _siteTypeController.text,
                        sourceType: _sourceTypeController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Lead ${_fullNameController.text}",
                          context,
                          backgroundColor: Colors.green,
                          duration: 3,
                          textColor: Colors.white,
                          border: Border.all(color: Colors.white),
                        );
                        setState(() {
                          // Update Future Builder
                        });
                      });
                      break;
                    case 'prospect':
                      _clienteleProvider
                          .addProspect(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                        siteType: _siteTypeController.text,
                        sourceType: _sourceTypeController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Prospect ${_fullNameController.text}",
                          context,
                          backgroundColor: Colors.green,
                          duration: 3,
                          textColor: Colors.white,
                          border: Border.all(color: Colors.white),
                        );
                        setState(() {
                          // Update Future Builder
                        });
                      });
                      break;
                  }
                })
          ],
        ),
      ),
    );
  }

}
