import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanrachna_web/models/material_model.dart';
import 'package:sanrachna_web/providers/material_provider.dart';
import 'package:sanrachna_web/views/widgets/title_widget.dart';
import 'package:toast/toast.dart';

class MaterialPage extends StatefulWidget {
  @override
  _MaterialPageState createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
  bool _dialVisible = true;
  String selectedMaterialType = "ply";

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
                        selectedMaterialType = "ply";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_applications,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Ply",
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
                        selectedMaterialType = "civil";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Civil",
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
                        selectedMaterialType = "tiles";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Tiles",
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
                        selectedMaterialType = "paint";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.format_paint,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Paint",
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
                        selectedMaterialType = "electric";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Electric",
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
                        selectedMaterialType = "plumbing";
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.transfer_within_a_station,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "Plumbing",
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
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 5,
            ),
            Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: _dataBuilder(state: selectedMaterialType))
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
        elevation: 4.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.dashboard),
              backgroundColor: Colors.red,
              label: 'Add Tiles',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "tiles");
              }),
          SpeedDialChild(
              child: Icon(Icons.location_city),
              backgroundColor: Colors.blue,
              label: 'Add Civil',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "civil");
              }),
          SpeedDialChild(
              child: Icon(Icons.lightbulb_outline),
              backgroundColor: Colors.red,
              label: 'Add Electric',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "electric");
              }),
          SpeedDialChild(
              child: Icon(Icons.format_paint),
              backgroundColor: Colors.blue,
              label: 'Add Paint',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "paint");
              }),
          SpeedDialChild(
              child: Icon(Icons.settings),
              backgroundColor: Colors.red,
              label: 'Add Ply',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "ply");
              }),
          SpeedDialChild(
              child: Icon(Icons.transfer_within_a_station),
              backgroundColor: Colors.blue,
              label: 'Add Plumbing',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                _addMaterialDialog(context, material: "plumbing");
              }),
        ],
      ),
    );
  }

  Widget _dataBuilder({String state}) {
    switch (state) {
      case 'civil':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
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
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _civil
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Material ${element.particulars}",
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
      case 'electric':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _electric = snapshot.data;

              if (_electric.length == 0) {
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
                      DataColumn(label: Text('Delete')),
                    ],
                    rows: _electric
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Material ${element.particulars}",
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
      case 'tiles':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _tiles = snapshot.data;

              if (_tiles.length == 0) {
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
                      DataColumn(label: Text('Delete')),
                    ],
                    rows: _tiles
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Material ${element.particulars}",
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
      case 'ply':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _ply = snapshot.data;

              if (_ply.length == 0) {
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
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _ply
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Material ${element.particulars}",
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
      case 'paint':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _paint = snapshot.data;

              if (_paint.length == 0) {
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
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _paint
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Labour ${element.particulars}",
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
      case 'plumbing':
        return FutureBuilder<Object>(
            future: _materialProvider.getMaterials(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              print("Line 74: ${snapshot.data}");

              _plumbing = snapshot.data;

              if (_plumbing.length == 0) {
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
                      DataColumn(label: Text("Delete")),
                    ],
                    rows: _plumbing
                        .map((element) => DataRow(cells: <DataCell>[
                              //Extracting from Map element the value
                              DataCell(Text("${element.particulars}")),
                              DataCell(Text("${element.rate}")),
                              DataCell(Text("${element.unit}")),
                              DataCell(Text("${element.quantity}")),
                              DataCell(IconButton(
                                onPressed: () {
                                  _materialProvider
                                      .deleteMaterial(int.parse(element.sno))
                                      .then((value) {
                                    Toast.show(
                                        "Deleting Material ${element.particulars}",
                                        context,
                                        backgroundColor: Colors.green);
                                    setState(() {});
                                    Toast.show(
                                        "Deleted Labour ${element.particulars}",
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

                        /// .where function available here
                        .toList(),
                  ),
                ],
              );
            });
        break;
    }
  }

  _addMaterialDialog(context, {material}) async {
    TextEditingController _particularsController = TextEditingController();
    TextEditingController _unitController = TextEditingController();
    TextEditingController _rateController = TextEditingController();
    TextEditingController _quantityController = TextEditingController();
    TextEditingController _prospectController = TextEditingController();

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
                Text("Add $material"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _particularsController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Particulars',
                        hintText: 'Particulars',
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
                      controller: _rateController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Rate',
                        hintText: 'Rate',
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
                      controller: _unitController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Unit',
                        hintText: 'Unit',
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
                      controller: _quantityController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        hintText: 'Quantity',
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
                      controller: _prospectController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Prospect',
                        hintText: 'Prospect',
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
                  switch (material) {
                    case 'electric':
                      _materialProvider
                          .addMaterials(
                              particulars: _particularsController.text,
                              rate: _rateController.text,
                              unit: _unitController.text,
                              quantity: _quantityController.text,
                              prospect: int.parse(_prospectController.text),
                              type: "ELECTRIC")
                          .then((value) {
                        Toast.show(
                          "Added Electic Material",
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
                    case 'paint':
                      _materialProvider
                          .addMaterials(
                              particulars: _particularsController.text,
                              rate: _rateController.text,
                              unit: _unitController.text,
                              quantity: _quantityController.text,
                              prospect: int.parse(_prospectController.text),
                              type: "PAINT")
                          .then((value) {
                        Toast.show(
                          "Added Paint Material",
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
                    case 'plumbing':
                      _materialProvider
                          .addMaterials(
                              particulars: _particularsController.text,
                              rate: _rateController.text,
                              unit: _unitController.text,
                              quantity: _quantityController.text,
                              prospect: int.parse(_prospectController.text),
                              type: "PLUMBING")
                          .then((value) {
                        Toast.show(
                          "Added Plumbing Material",
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
                    case 'ply':
                      _materialProvider
                          .addMaterials(
                              particulars: _particularsController.text,
                              rate: _rateController.text,
                              unit: _unitController.text,
                              quantity: _quantityController.text,
                              prospect: int.parse(_prospectController.text),
                              type: "PLY")
                          .then((value) {
                        Toast.show(
                          "Added Ply Material",
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
                    case 'tiles':
                      _materialProvider
                          .addMaterials(
                              particulars: _particularsController.text,
                              rate: _rateController.text,
                              unit: _unitController.text,
                              quantity: _quantityController.text,
                              prospect: int.parse(_prospectController.text),
                              type: "TILES")
                          .then((value) {
                        Toast.show(
                          "Added Tiles Material",
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
