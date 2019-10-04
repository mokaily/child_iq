import 'package:child_iq/data/theme.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  final String name;
  final String image;
  final Color one;
  final Color two;
  final int a;
  const HomeBody(this.name, this.image, this.one, this.two, this.a, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (a == 3) {
            alert(context);
          }
          if (a == 0) {
            Navigator.pushNamed(context, '/CommonQ');
          }
          if (a == 1) {
            Navigator.pushNamed(context, '/WhyQ');
          }
          if (a == 2) {
            Navigator.pushNamed(context, '/AboutMe');
          }
        },
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.1, 0.4],
                    colors: [
                      one,
                      two,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Container(
                padding: EdgeInsets.all(4.0),
                alignment: Alignment(0.0, 0.0),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                name,
                style: TextStyle(fontSize: 11.5,letterSpacing: -1.2),
                textAlign: TextAlign.center,
              )),
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )),
            )
          ],
        ));
  }
}

void alert(BuildContext context) {
  var alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: StyleCustom().mainBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.error_outline, color: Colors.white),
              Text(" مهم جداً",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(4.0),
            //height: MediaQuery.of(context).size.height * 0.44,
            color: StyleCustom().bg,
            child: Scrollbar(
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text(
                    "هذا الاختبار العالمي يعطيك نتيجة متقاربة مع شخصية ابنك في حال كانتإجاباتك دقيقة اجعل إجاباتك تصف حاله ابنك الآن وليس ما ينبغي أن تكونعليه وبذلك تصل لنتيجة دقيقة",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Divider(
                    indent: 20.0,
                    endIndent: 20.0,
                    height: 5.0,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text(
                    "قرر لكل واحد من السلوكيات التالية الترتيب أو الرقم الذي يعتبرأدق وصف لسلوك طفلك",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      as("3", "ينطبق و يمارسه دائماً"),
                      as("2", "يمارس هذا السلوك غالباً"),
                      as("1", "يمارس هذا السلوك نادراً"),
                      as("0", "لا ينطبق علي ابنى ابداً"),
                    ],
                  )
                ],
              )),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, "/Quiz");
          },
          child: Container(
            child: Text("ابداً الأختبار"),
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
      ));

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

as(String a, String s) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Container(
          width: 30.0,
          child: Text(
            a,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, letterSpacing: -8),
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
        Text(
          s,
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
