import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/providers/prospect_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';

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
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Full Name')),
                            DataColumn(label: Text('Organization')),
                            DataColumn(label: Text("Phone Number")),
                            DataColumn(label: Text('Site Type')),
                            DataColumn(label: Text("Source Type")),
                            DataColumn(label: Text("Delete")),
                          ],
                          rows: _prospectList
                              .map((element) => DataRow(cells: <DataCell>[
                                    DataCell(Text("${element.id}")),
                                    DataCell(Text("${element.email}")),
                                    DataCell(Text("${element.fullName}")),
                                    DataCell(Text("${element.organization}")),
                                    DataCell(Text("${element.mobileNumber}")),
                                    DataCell(Text("${element.siteType}")),
                                    DataCell(Text("${element.sourceType}")),
                                    DataCell(IconButton(
                                      onPressed: () {
                                        _prospectProvider
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
                onTap: () {
                  _addProspectDialog(context, prospect: "prospect");
                }),
          ],
        ));
  }

  _addProspectDialog(context, {prospect}) async {
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
            width: MediaQuery.of(context).size.width/2,
            child: Column(
              children: <Widget>[
                Text("Add Prospect"),
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
            FlatButton(
                child: Text("CANCEL", style: TextStyle(color: Colors.redAccent, fontSize: 16.0),),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text("ADD", style: TextStyle(color: Colors.blue ,fontSize: 16.0),),
                onPressed: () {
                  // add it
                  print("Trying to add prospect");

                  switch (prospect) {
                    case 'prospect':
                      print("Line 223: Inside Prospect Case");
                      _prospectProvider
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
