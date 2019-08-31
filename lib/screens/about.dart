import 'package:flutter/material.dart';
import '../data/theme.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marginFixed = MediaQuery.of(context).size.width * 0.040;
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
          title: Text("من أنا",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300))),
      backgroundColor: StyleCustom().bg,
      body: Container(
          margin: EdgeInsets.only(left: marginFixed, right: marginFixed),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: ExactAssetImage('assets/me.png'),
                      minRadius: 40,
                      maxRadius: 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "فهد بن عبد العزيز النقيثان",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "ماجستير إدارة وإشراف تربوي\nرائد نشاط - إدارة تعليم الرياض",
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text("اهتماماتى :", style: TextStyle(fontSize: 14)),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Text(
                      "- تمتين المواهب واكتشاف القيم\n- صناعة الماركة الشخصيةواستثمار نقاط القوة لدى الأفراد",
                      style: TextStyle(color: Colors.black54, fontSize: 14))),
              Text("رسالتي :", style: TextStyle(fontSize: 14)),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Text(
                      "إشعار الأفراد بنقاط تفردهم حتى يستثمروها فى صناعة بصمة لهم في الحياة",
                      style: TextStyle(color: Colors.black54, fontSize: 14))),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ContactMe');
                },
                color: StyleCustom().mainBlue,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 14,
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Text("تواصل معي",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14))
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Image.asset("assets/logo.png",
                  height: 90, alignment: Alignment(-1, 0))
            ],
          )),
    );
  }
}
