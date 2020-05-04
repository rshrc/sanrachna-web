import 'package:flutter/material.dart';
import 'package:sanrachna_web/views/pages/associate.dart';
import 'package:sanrachna_web/views/pages/clientele.dart';
import 'package:sanrachna_web/views/pages/database.dart';
import 'package:sanrachna_web/views/pages/home_page.dart';
import 'package:sanrachna_web/views/pages/prospect.dart';

void main() {
  runApp(Sanrachna());
}

class Sanrachna extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.redAccent, indicatorColor: Colors.yellow,splashColor: Colors.yellow),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Associate",),
                Tab(text: "Clientele"),
                Tab(text: "Database",),
                Tab(text: "Prospect",),
              ],
            ),
            title: Text('Sanrachna'),
            centerTitle: true,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              AssociatePage(),
              ClientalePage(),
              DatabasePage(),
              ProspectPage(),
            ],
          ),
        ),
      ),
    );
  }
}
