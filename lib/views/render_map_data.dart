import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supervisor/Labour"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getMLS(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<dynamic> json = snapshot.data;

            Map<String, List<String>> map = Map();

            print("Line 15: $json");

            json.forEach((element) {
              print("Line 20: ${element['supervisor_name']}");
              if (map.containsKey(element['supervisor_name'])) {
                map[element['supervisor_name']].add(element['labour_name']);
              } else {
                map[element['supervisor_name']] = [element['labour_name']];
              }
            });

            List<String> _supervisorList = map.keys.toList();

            print("Line 32 : $map");

            return RenderLS(supervisorList: _supervisorList, map: map);
          }),
    );
  }

  static Future<dynamic> getMLS() async {
    http.Response response = await http
        .get('https://sanrachna.pythonanywhere.com/api/associate/mls/');

    print("Line 18 : ${response.body}");

    print("Line 36: ${jsonDecode(response.body).runtimeType}");

    return jsonDecode(response.body);
  }
}

class RenderLS extends StatefulWidget {
  List<String> supervisorList;
  dynamic map;

  RenderLS({this.supervisorList, this.map});

  @override
  _RenderLSState createState() => _RenderLSState();
}

class _RenderLSState extends State<RenderLS> {

  String supervisorKey;

  @override
  void initState() {
    supervisorKey = widget.supervisorList[0];
    print("Line 77 : $supervisorKey");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Supervisor"),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: 200,
                child: ListView.builder(
                  itemCount: widget.supervisorList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // set key of map to this
                        setState(() {
                          supervisorKey = widget.supervisorList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${widget.supervisorList[index]}"),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Text("Labour"),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                  itemCount: widget.map[supervisorKey].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(widget.map[supervisorKey][index]),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}