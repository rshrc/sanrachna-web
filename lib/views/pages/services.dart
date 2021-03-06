import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sanrachna_web/models/prospect_model.dart';
import 'package:sanrachna_web/models/service_model.dart';
import 'package:sanrachna_web/providers/prospect_provider.dart';
import 'package:sanrachna_web/providers/service_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  bool _dialVisible = true;

  List<ServiceModel> _serviceList = [];

  List<ProspectModel> _prospectList = [];

  ServiceProvider _serviceProvider = ServiceProvider();

  @override
  void initState() {
    /// Need to get all the prospects
    ProspectProvider().getProspects().then((value) {
      _prospectList = value;
      print("Line 31: $_prospectList");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<Object>(
                  future: _serviceProvider.getServices(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    print("Line 40: ${snapshot.data}");

                    _serviceList = snapshot.data;

                    return Column(
                      children: [
                        TitleWidget(title: "Service"),
                        DataTable(
                          columnSpacing: 132,
                          columns: [
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Unit')),
                            DataColumn(label: Text('Rate')),
                            DataColumn(label: Text('Prospect')),
                            DataColumn(label: Text('Delete')),
                          ],
                          rows: _serviceList
                              .map((element) => DataRow(cells: <DataCell>[
                                    DataCell(Text("${element.name}")),
                                    DataCell(Text("${element.unit}")),
                                    DataCell(Text("${element.rate}")),
                                    DataCell(Text("${element.prospect}")),
                                    DataCell(IconButton(
                                      onPressed: () {
                                        _serviceProvider
                                            .deleteServices(element.id)
                                            .then((value) {
                                          Toast.show(
                                              "Deleting Prospect ${element.name}",
                                              context,
                                              backgroundColor: Colors.green);
                                          setState(() {});
                                          Toast.show(
                                              "Deleted Prospect ${element.name}",
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
          tooltip: 'Add Service',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.accessibility),
                backgroundColor: Colors.red,
                label: 'Add Service',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () {
                  _addProspectDialog(context, service: "service");
                }),
          ],
        ));
  }

  _addProspectDialog(context, {service}) async {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _unitController = TextEditingController();
    TextEditingController _rateController = TextEditingController();
    TextEditingController _prospectController = TextEditingController();

    ProspectModel dropdownProspectValue = _prospectList[0];

    int prospectId = _prospectList[0].id;

    TextStyle _labelTextStyle = TextStyle(color: Colors.black);
    TextStyle _hintTextStyle = TextStyle(color: Colors.black, fontSize: 10.0);

    await showDialog<String>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.3,
          child: AlertDialog(
            shape:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            content: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                children: <Widget>[
                  Text("Add Service"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'John Doe',
                            labelStyle: _labelTextStyle,
                            hintStyle: _hintTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _unitController,
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: 'Unit',
                            hintText: 'Unit',
                            labelStyle: _labelTextStyle,
                            hintStyle: _hintTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _rateController,
                        autofocus: true,
                        decoration: InputDecoration(
                            labelText: 'Rate',
                            hintText: 'Rate',
                            labelStyle: _labelTextStyle,
                            hintStyle: _hintTextStyle),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text("Prospect: "),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 6,
                              child: DropdownButton<ProspectModel>(
                                value: dropdownProspectValue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 24,
                                elevation: 8,
                                style: TextStyle(color: Colors.blue),
                                onChanged: (ProspectModel prospectModel) {
                                  setState(() {
                                    dropdownProspectValue = prospectModel;
                                    prospectId = prospectModel.id;
                                  });
                                },
                                items: _prospectList
                                    .map<DropdownMenuItem<ProspectModel>>(
                                        (ProspectModel value) {
                                  return DropdownMenuItem<ProspectModel>(
                                    value: value,
                                    child: Text(value.fullName),
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
              IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    // add it
                    print("Trying to add prospect");

                    switch (service) {
                      case 'service':
                        print("Line 223: Inside service Case");
                        _serviceProvider
                            .addServices(
                          name: _nameController.text,
                          unit: _unitController.text,
                          rate: _rateController.text,
                          prospect: prospectId,
                        )
                            .then((value) {
                          Toast.show(
                            "Added Service ${_nameController.text}",
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
      ),
    );
  }
}
