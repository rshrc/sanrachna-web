import 'package:flutter/material.dart';

class RenderMD extends StatefulWidget {
  List<String> ownerList;
  dynamic map;

  RenderMD({this.ownerList, this.map});

  @override
  _RenderMDState createState() => _RenderMDState();
}

class _RenderMDState extends State<RenderMD> {
  String ownerKey;

  @override
  void initState() {
    ownerKey = widget.ownerList[0];
    print("Line 77 : $ownerKey");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: 200,
                child: ListView.builder(
                  itemCount: widget.ownerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            ownerKey = widget.ownerList[index];
                          });
                        },
                        elevation: 0.5,
                        color: Colors.white70,
                        child: Text("${widget.ownerList[index]}"),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                  itemCount: widget.map[ownerKey].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RaisedButton(
                        onPressed: null,
                        disabledColor: Colors.redAccent,
                        child: Text(
                          widget.map[ownerKey][index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
