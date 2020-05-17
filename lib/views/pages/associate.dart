import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanrachna_web/models/associate_model.dart';
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/models/service_model.dart';
import 'package:sanrachna_web/providers/associate_provider.dart';
import 'package:sanrachna_web/providers/labour_list_provider.dart';
import 'package:sanrachna_web/providers/map_provider.dart';
import 'package:sanrachna_web/providers/material_provider.dart';
import 'package:sanrachna_web/providers/service_provider.dart';
import 'package:sanrachna_web/utils/constants.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssociatePage extends StatefulWidget {
  @override
  _AssociatePageState createState() => _AssociatePageState();
}

class _AssociatePageState extends State<AssociatePage> {
  bool _dialVisible = true;

  AssociateProvider _associateProvider = AssociateProvider();
  ServiceProvider _serviceProvider = ServiceProvider();

  List<AssociateModel> _labourList = [];
  List<AssociateModel> _supervisorList = [];
  List<AssociateModel> _vendorList = [];

  String dataBuilderState = 'labour'; // initial state
  String _selectedLabour = "SELECT LABOUR";
  String _selectedSupervisor = "SELECT SUPERVISOR";
  String _dropdownSupervisorValue = "SELECT SUPERVISOR";
  String _selectedService = "SELECT SERVICE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 7,
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
                        dataBuilderState = 'labour';
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Labour",
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
                        dataBuilderState = 'vendor';
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Vendor",
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
                        dataBuilderState = 'supervisor';
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.supervisor_account,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Supervisor",
                          style: GoogleFonts.exo(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    elevation: 0.0,
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Map Data",
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
                        dataBuilderState = 'map_ls';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Labour/Supervisor",
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
                        dataBuilderState = 'map_ss';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Services/Supervisor",
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
                        dataBuilderState = 'map_mv';
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Material/Vendor",
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
        tooltip: 'Add Associate',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.settings),
            backgroundColor: Colors.red,
            label: 'Add Labour',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _addAssociateDialog(context, associate: "labour");
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.people_outline),
            backgroundColor: Colors.blue,
            label: 'Add Supervisor',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _addAssociateDialog(context, associate: "supervisor");
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add_shopping_cart),
            backgroundColor: Colors.red,
            label: 'Add Vendor',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              _addAssociateDialog(context, associate: "vendor");
            },
          ),
        ],
      ),
    );
  }

  /// Data render for Labour, Vendor, Supervisor
  Widget _dataBuilder({String state}) {
    switch (state) {
      case 'labour':
        return FutureBuilder<Object>(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TitleWidget(title: "Labour"),
                  DataTable(
                    columnSpacing: 132.0,
                    columns: [
                      DataColumn(label: Text('Full Name')),
                      DataColumn(label: Text('Organization')),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("Mobile")),
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _labourList
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _associateProvider
                                      .deleteLabour(element.id)
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Labour ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Labour ${element.fullName}",
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
      case 'supervisor':
        return FutureBuilder<Object>(
            future: _associateProvider.getSupervisors(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _supervisorList = snapshot.data;

              if (_supervisorList.length == 0) {
                return Center(
                  child: Text("No Data"),
                );
              }

              return Column(
                children: [
                  TitleWidget(title: "Supervisor"),
                  DataTable(
                    columnSpacing: 132.0,
                    columns: [
                      DataColumn(label: Text('Full Name')),
                      DataColumn(label: Text('Organization')),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("Mobile")),
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _supervisorList
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _associateProvider
                                      .deleteSupervisor(element.id)
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Supervisor ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Supervisor ${element.fullName}",
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
      case 'vendor':
        return FutureBuilder<Object>(
            future: _associateProvider.getVendors(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _vendorList = snapshot.data;

              if (_vendorList.length == 0) {
                return Center(
                  child: Text("No Data"),
                );
              }

              return Column(
                children: [
                  TitleWidget(title: "Vendor"),
                  DataTable(
                    columnSpacing: 132.0,
                    columns: [
                      DataColumn(label: Text('Full Name')),
                      DataColumn(label: Text('Organization')),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("Mobile")),
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _vendorList
                        .map((element) => DataRow(cells: <DataCell>[
                              DataCell(Text("${element.fullName}")),
                              DataCell(Text("${element.organization}")),
                              DataCell(Text("${element.email}")),
                              DataCell(Text("${element.mobileNumber}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _associateProvider
                                      .deleteVendor(element.id)
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Vendor ${element.fullName}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Vendor ${element.fullName}",
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

      /// when we are switching to the map interface (Labour/Supervisor)

      case 'map_ls':
        return _mappingDataBuilder(state: state);
        break;

      /// when we are switching to (Service/Supervisor)

      case 'map_ss':
        return _mappingDataBuilder(state: state);

        break;

      /// when we are switching to (Material/Vendor)

      case 'map_mv':
        return _mappingDataBuilder(state: state);

        break;
    }
    return null;
  }

  /// Data render for Map data functionality
  Widget _mappingDataBuilder({String state}) {
    AssociateProvider _associateProvider = AssociateProvider();
    ServiceProvider _serviceProvider = ServiceProvider();
    MaterialProvider _materialProvider = MaterialProvider();

    switch (state) {
      case 'map_ls':
        String _labourId, _supervisorId;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(title: "Labour/Supervisor", fontSize: 20.0),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FutureBuilder(
                          future: _associateProvider.getLabours(),
                          builder: (context, snap) {
                            if (!snap.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            List<AssociateModel> _laboursList = snap.data;

                            print("Line 558: $_laboursList");

                            List<String> _labourNames = [];
                            _labourNames?.clear();
                            _labourNames.add("SELECT LABOUR");
                            _laboursList.forEach((element) {
                              _labourNames.add(element.fullName);
                            });

                            _labourId = "";

                            return Column(
                              children: [
                                DropdownButton<String>(
                                  value: _selectedLabour,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 24,
                                  elevation: 8,
                                  style: TextStyle(color: Colors.blue),
                                  onChanged: (String labour) {
                                    setState(() {
                                      _selectedLabour = labour;
                                      print("Line 595: $_selectedLabour");
                                    });
                                    var list = _buildLabourMap(_labourList);
                                    print("Line 598: $list");
                                    print("Line 599: $_selectedLabour");

                                    print(
                                        "Labour ID ${list[0][_selectedLabour]}");

                                    Constants.labourId =
                                        list[0][_selectedLabour].toString();

                                    list.forEach((item) {
                                      if (item[_selectedLabour] != null) {
                                        _labourId =
                                            item[_selectedLabour].toString();
                                      }
                                    });

                                    print("Line 684 >>>>>>> : $_labourId");
                                    Constants.labourId= _labourId;

                                    print(
                                        "Before exiting ::::::: ${Constants.labourId} Yeah Yeah value changed");
                                  },
                                  items: _labourNames
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                Container(
                                  width: 100.0,
                                  child: ListView.builder(
                                      padding: EdgeInsets.only(top: 40.0),
                                      shrinkWrap: true,
                                      itemCount: _laboursList.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                            "${_laboursList[index].fullName}");
                                      }),
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                  FutureBuilder(
                      future: _associateProvider.getSupervisors(),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<AssociateModel> _supervisorList = snap.data;
                        //_buildSupervisorMap(_supervisorList);
                        List<String> _supervisorNames = [];
                        _supervisorNames?.clear();
                        _supervisorNames.add("SELECT SUPERVISOR");
                        _supervisorList.forEach((element) {
                          _supervisorNames.add(element.fullName);
                        });

                        _supervisorId = "";

                        return Column(
                          children: [
                            DropdownButton<String>(
                              value: _dropdownSupervisorValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 8,
                              style: TextStyle(color: Colors.blue),
                              onChanged: (String supervisor) {
                                setState(() {
                                  _dropdownSupervisorValue = supervisor;
                                  print("665: $_dropdownSupervisorValue");
                                });

                                List<Map<String, dynamic>> list =
                                    _buildSupervisorMap(_supervisorList);
                                print("Line 657: $list");
                                print("Line 660: $_dropdownSupervisorValue");

                                // lets find the id
                                // [{Tejas Sharma: 1}, {Devashish: 2}]

                                Constants.supervisorId = list[0]
                                        [_dropdownSupervisorValue]
                                    .toString();

                                print(
                                    "Supervisor ID Line 672 : $_supervisorId");

                                list.forEach((item) {
                                  if (item[_dropdownSupervisorValue] != null) {
                                    _supervisorId =
                                        item[_dropdownSupervisorValue].toString();
                                  }
                                });

                                print("Line 684 >>>>>>> : $_supervisorId");
                                Constants.supervisorId = _supervisorId;

                                print(
                                    "Before exiting ::::::: ${Constants.supervisorId} Yeah Yeah value changed");
                              },
                              items: _supervisorNames
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Container(
                              width: 100.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(top: 40.0),
                                  shrinkWrap: true,
                                  itemCount: _supervisorList.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        "${_supervisorList[index].fullName}");
                                  }),
                            )
                          ],
                        );
                      }),
                  Column(
                    children: [
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          "Map",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          print(
                              "Line 712: Gonna Map ${Constants.labourId} & ${Constants.supervisorId}");

                          _labourId = Constants.labourId;
                          _supervisorId = Constants.supervisorId;

                          if (_labourId != null && _supervisorId != null) {
                            await MapProvider.mapLabourToSupervisor(
                              labourId: int.parse(_labourId),
                              supervisorId: int.parse(_supervisorId),
                            ).then((value) {
                              Toast.show("Mapped data", context,
                                  backgroundColor: Colors.green, duration: 2);
                              setState(() {});
                            });
                          } else {
                            Toast.show("Select Data", context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
        break;
      case 'map_ss':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(title: "Service/Supervisor", fontSize: 20.0),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                      future: _serviceProvider.getServices(),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<ServiceModel> _serviceList = snap.data;
                        List<String> _serviceNames = [];
                        _serviceNames?.clear();
                        _serviceNames.add("SELECT SERVICE");
                        _serviceList.forEach((element) {
                          _serviceNames.add(element.name);
                        });

                        print("Line 558: $_serviceList");

                        return Column(
                          children: [
                            DropdownButton<String>(
                              value: _selectedService,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 8,
                              style: TextStyle(color: Colors.blue),
                              onChanged: (String service) {
                                setState(() {
                                  _selectedService = service;
                                });
                              },
                              items: _serviceNames
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Container(
                              width: 100.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(top: 40.0),
                                  shrinkWrap: true,
                                  itemCount: _serviceList.length,
                                  itemBuilder: (context, index) {
                                    return Text("${_serviceList[index].name}");
                                  }),
                            )
                          ],
                        );
                      }),
                  FutureBuilder(
                      future: _associateProvider.getSupervisors(),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<AssociateModel> _supervisorList = snap.data;
                        List<String> _supervisorNames = [];
                        _supervisorNames?.clear();
                        _supervisorNames.add("SELECT SUPERVISOR");
                        _supervisorList.forEach((element) {
                          _supervisorNames.add(element.fullName);
                        });

                        return Column(
                          children: [
                            DropdownButton<String>(
                              value: _selectedSupervisor,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              elevation: 8,
                              style: TextStyle(color: Colors.blue),
                              onChanged: (String supervisor) {
                                setState(() {
                                  _selectedSupervisor = supervisor;
                                });
                              },
                              items: _supervisorNames
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Container(
                              width: 100.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.only(top: 40.0),
                                  shrinkWrap: true,
                                  itemCount: _supervisorList.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        "${_supervisorList[index].fullName}");
                                  }),
                            )
                          ],
                        );
                      }),
                  Column(
                    children: [
                      RaisedButton(
                        color: Colors.redAccent,
                        child: Text(
                          "Map",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 40.0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        );
        break;
      case 'map_mv':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(title: "Material/Vendor", fontSize: 20.0),
            SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FutureBuilder(
                      future: _materialProvider.getMaterials(),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<MaterialModel> _materialList = snap.data;

                        MaterialModel _dropdownMaterialValue = _materialList[0];

                        print("Line 558: $_materialList");

                        return DropdownButton<MaterialModel>(
                          value: _dropdownMaterialValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 24,
                          elevation: 8,
                          style: TextStyle(color: Colors.blue),
                          onChanged: (MaterialModel material) {
                            setState(() {
                              _dropdownMaterialValue = material;
                            });
                          },
                          items: _materialList
                              .map<DropdownMenuItem<MaterialModel>>(
                                  (MaterialModel value) {
                            return DropdownMenuItem<MaterialModel>(
                              value: value,
                              child: Text(value.particulars),
                            );
                          }).toList(),
                        );
                      }),
                  FutureBuilder(
                      future: _associateProvider.getVendors(),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        List<AssociateModel> _vendorList = snap.data;

                        AssociateModel _dropdownVendorValue = _vendorList[0];

                        return DropdownButton<AssociateModel>(
                          value: _dropdownVendorValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 24,
                          elevation: 8,
                          style: TextStyle(color: Colors.blue),
                          onChanged: (AssociateModel vendor) {
                            setState(() {
                              _dropdownVendorValue = vendor;
                            });
                          },
                          items: _vendorList
                              .map<DropdownMenuItem<AssociateModel>>(
                                  (AssociateModel value) {
                            return DropdownMenuItem<AssociateModel>(
                              value: value,
                              child: Text(value.fullName),
                            );
                          }).toList(),
                        );
                      }),
                  RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      "Map",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        );
        break;
    }
    return null;
  }

  _addAssociateDialog(context, {associate}) async {
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _organizationController = TextEditingController();
    TextEditingController _mobileNumberController = TextEditingController();
    TextEditingController _emailController = TextEditingController();

    TextStyle _labelTextStyle = TextStyle(color: Colors.black);
    TextStyle _hintTextStyle = TextStyle(color: Colors.black, fontSize: 10.0);

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
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _fullNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Full Name *',
                        hintText: 'John Doe',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle,
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
                        hintText: 'Doe Org',
                        labelStyle: _labelTextStyle,
                        hintStyle: _hintTextStyle,
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
                    padding: const EdgeInsets.all(8.0),
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
                  switch (associate) {
                    case 'labour':
                      _associateProvider
                          .addLabour(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Labour ${_fullNameController.text}",
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
                    case 'supervisor':
                      _associateProvider
                          .addSupervisor(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Supervisor ${_fullNameController.text}",
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
                    case 'vendor':
                      _associateProvider
                          .addVendors(
                        fullName: _fullNameController.text,
                        organization: _organizationController.text,
                        mobileNumber: _mobileNumberController.text,
                        email: _emailController.text,
                      )
                          .then((value) {
                        Toast.show(
                          "Added Vendor ${_fullNameController.text}",
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

  /// Building a list of map, with unique key,value pair to search the corresponding id of the selected supervisor
  List<Map<String, int>> _buildSupervisorMap(List<AssociateModel> supervisors) {
    List<Map<String, int>> data = [];
    supervisors.forEach((supervisor) {
      data.add({supervisor.fullName: supervisor.id});
    });

    return data;
  }

  /// Building a list of map, with unique key,value pair to search the corresponding id of the selected labour
  List<Map<String, int>> _buildLabourMap(List<AssociateModel> labours) {
    List<Map<String, int>> data = [];
    labours.forEach((labour) {
      data.add({labour.fullName: labour.id});
    });

    print("Line 1148: Labour Map : $data");

    return data;
  }

  /// Building a list of map, with unique key,value pair to search the corresponding id of the selected service
  List<Map<String, int>> _buildServiceMap(List<ServiceModel> services) {
    List<Map<String, int>> data = [];
    services.forEach((service) {
      data.add({service.name: service.id});
    });

    return data;
  }
}
