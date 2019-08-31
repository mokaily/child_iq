import 'package:flutter/material.dart';
import '../data/theme.dart';
import '../data/why.dart';

class WhyQ extends StatelessWidget {
  const WhyQ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = [
      StyleCustom().blue,
      StyleCustom().rose,
      StyleCustom().orange,
      StyleCustom().silver
    ];
    var marginFixed = MediaQuery.of(context).size.width * 0.040;
    var x = DataWhy().questions;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: StyleCustom().bg,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.black)),
          title: Text(
            "لماذا ابنى اذكي مما أتوقع؟",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),
          )),
      backgroundColor: StyleCustom().bg,
      body: ListView.builder(
        itemCount: x.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              alert(context, x[index][0], x[index][1]);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white),
              margin: EdgeInsets.only(
                  left: marginFixed, right: marginFixed, bottom: 10),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text(x[index][0])),
                  Icon(Icons.help, color: colors[index % 4])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void alert(BuildContext context, var title, var answer) {
  var alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.62,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: StyleCustom().mainBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    title.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ),
            Container(alignment: Alignment(0,0),
                padding: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.44,
                color: StyleCustom().bg,
                child: Scrollbar(
                  child: ListView(children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ]),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text("حسناً"),
                alignment: Alignment(0, 0),
                padding: EdgeInsets.all(4.0),
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
              ),
            )
          ],
        ),
      )));

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}
