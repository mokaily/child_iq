import 'package:flutter/material.dart';
import '../data/theme.dart';
import './homeBody.dart';
import '../data/mainData.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginFixed = MediaQuery.of(context).size.width * 0.040;
    return Scaffold(
        backgroundColor: StyleCustom().bg,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
                child: Container(
                  padding: EdgeInsets.all(marginFixed * 2),
                  alignment: Alignment(0.0, -0.5),
                  child: Image.asset("assets/fg1.png"),
                ),
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bg1.png"),
                        fit: BoxFit.cover))),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 1,
                    child: GridView.count(
                      primary: false,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      crossAxisCount: 2,
                      children: <Widget>[
                        HomeBody(DataM.names[1], DataM.images[1],
                            DataM.colors[1], DataM.colors2[1], 1),
                        HomeBody(DataM.names[0], DataM.images[0],
                            DataM.colors[0], DataM.colors2[0], 0),
                        HomeBody(DataM.names[3], DataM.images[3],
                            DataM.colors[3], DataM.colors2[3], 3),
                        HomeBody(DataM.names[2], DataM.images[2],
                            DataM.colors[2], DataM.colors2[2], 2),
                      ],
                    ),
                  )
                ])),
          ],
        )));
  }
}
