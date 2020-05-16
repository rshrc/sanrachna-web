import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanrachna_web/models/clientele_model.dart';
import 'package:sanrachna_web/providers/clientele_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClientalePage extends StatefulWidget {
  @override
  _ClientalePageState createState() => _ClientalePageState();
}

class _ClientalePageState extends State<ClientalePage> {
  bool _dialVisible = true;
  List<ClienteleModel> _clientList = [];
  List<ClienteleModel> _leadList = [];
  List<ClienteleModel> _prospectList = [];

  String dataBuilderState = 'leads'; // initial state

  ClienteleProvider _clienteleProvider = ClienteleProvider();
  String _siteType = "COMMERCIAL";


  onDropdownChanged(String value){
    setState(() {
      _siteType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 8,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.symmetric(
                        vertical: BorderSide(color: Colors.white, width: 2.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      elevation: 0.0,
                      onPressed: () {
                        setState(() {
                          dataBuilderState = 'leads';
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.directions_walk,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Leads",
                            style: GoogleFonts.exo(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      elevation: 0.0,
                      onPressed: () {
                        setState(() {
                          dataBuilderState = 'clients';
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.business_center,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Clients",
                            style: GoogleFonts.exo(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.redAccent,
                      elevation: 0.0,
                      onPressed: () {
                        setState(() {
                          dataBuilderState = 'prospects';
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.pages,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Prospects",
                            style: GoogleFonts.exo(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: _dataBuilder(state: dataBuilderState)),
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
                child: Icon(FontAwesomeIcons.male),
                backgroundColor: Colors.red,
                label: 'Add Client',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  _addClienteleDialog(context, clientele: 'client');
                }),
            SpeedDialChild(
              child: Icon(FontAwesomeIcons.briefcase),
              backgroundColor: Colors.blue,
              label: 'Add Leads',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addClienteleDialog(context, clientele: 'lead');
              },
            ),
            SpeedDialChild(
              child: Icon(FontAwesomeIcons.users),
              backgroundColor: Colors.red,
              label: 'Add Prospects',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addClienteleDialog(context, clientele: 'prospect');
              },
            ),
          ],
        ));
  }

  Widget _dataBuilder({String state}) {
    switch (state) {
      case 'leads':
        return FutureBuilder<Object>(
            future: _clienteleProvider.getLeads(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _leadList = snapshot.data;

              if (_leadList.length == 0) {
                return Center(
                  child: Text("No Data"),
                );
              }

              return Column(
                children: [
                  TitleWidget(title: "Leads"),
                  DataTable(
                    columnSpacing: 80,
                    columns: [
                      DataColumn(label: Text('Full Name')),
                      DataColumn(label: Text('Organization')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Mobile')),
                      DataColumn(label: Text('Site Type')),
                      DataColumn(label: Text('Source Type')),
                      DataColumn(label: Text("Delete")),
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
                              DataCell(IconButton(
                                onPressed: () {
                                  _clienteleProvider
                                      .deleteLead(element.id)
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Lead ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Lead ${element.fullName}",
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
            });
        break;
      case 'clients':
        return FutureBuilder<Object>(
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
                    columnSpacing: 80,
                    columns: [
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
                                    Toast.show(
                                        "Deleting Client ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Client ${element.fullName}",
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
            });
        break;
      case 'prospects':
        return FutureBuilder<Object>(
            future: _clienteleProvider.getProspects(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _prospectList = snapshot.data;

              if (_prospectList.length == 0) {
                return Center(
                  child: Text("No Data"),
                );
              }

              return Column(
                children: [
                  TitleWidget(title: "Prospects"),
                  DataTable(
                    columnSpacing: 80,
                    columns: [
                      DataColumn(label: Text('Full Name')),
                      DataColumn(label: Text('Organization')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Mobile')),
                      DataColumn(label: Text('Site Type')),
                      DataColumn(label: Text('Source Type')),
                      DataColumn(label: Text('Delete')),
                    ],
                    rows: _prospectList
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(Text("${element.siteType}")),
                              DataCell(Text("${element.sourceType}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _clienteleProvider
                                      .deleteProspect(element.id)
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Prospect ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Prospect ${element.fullName}",
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
            });
        break;
    }
  }

  _addClienteleDialog(context, {clientele}) async {
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _organizationController = TextEditingController();
    TextEditingController _mobileNumberController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _siteTypeController = TextEditingController();
    TextEditingController _sourceTypeController = TextEditingController();
    TextStyle _labelTextStyle = TextStyle(color: Colors.black);
    TextStyle _hintTextStyle = TextStyle(color: Colors.black, fontSize: 10.0);
    String _sourceType = "ONLINE";

    await showDialog<String>(
      context: context,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.3,
        child: AlertDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          content: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: <Widget>[
                Text("Add Labour"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _fullNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Full Name *',
                        hintText: 'John Doe',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _organizationController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Organization',
                        hintText: 'Doe Org',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _mobileNumberController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number *',
                        hintText: '1234567890',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      controller: _emailController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Email ID *',
                        hintText: 'johndoe@gmail.com',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text("Site Type: "),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: DropdownButton<String>(
                              value: _siteType,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 8,
                              style: TextStyle(color: Colors.blue),
                              onChanged: onDropdownChanged,
                              items: <String>[
                                'COMMERCIAL',
                                'HOME',
                                'OFFICE'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text("Source Type: "),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 6,
                            child: DropdownButton<String>(
                              value: _sourceType,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 8,
                              style: TextStyle(color: Colors.blue),
                              onChanged: (String newValue) {
                                setState(() {
                                  _sourceType = newValue;
                                });
                              },
                              items: <String>[
                                'ONLINE',
                                'OFFLINE'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
                child: Text(
                  "CANCEL",
                  style: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                ),
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
                        siteType: _siteType,
                        sourceType: _sourceType,
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
