import 'package:flutter/material.dart';
import '../data/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/suggest.dart';
import '../data/savePdf.dart';
import 'package:share/share.dart';


class QuizResult extends StatefulWidget {
  final result;
  QuizResult({Key key,this.result}) : super(key: key);

  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {

  int r0 = 0;
  int r1 = 0;
  int r2 = 0;
  int r3 = 0;
  int r4 = 0;
  int r5 = 0;
  int r6 = 0;
  int r7 = 0;
  var results;
  SharedPreferences prefs;

  wait() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();
    wait();
  }

//Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      r0 = (prefs.getInt('r0') ?? 0);
      r1 = (prefs.getInt('r1') ?? 0);
      r2 = (prefs.getInt('r2') ?? 0);
      r3 = (prefs.getInt('r3') ?? 0);
      r4 = (prefs.getInt('r4') ?? 0);
      r5 = (prefs.getInt('r5') ?? 0);
      r6 = (prefs.getInt('r6') ?? 0);
      r7 = (prefs.getInt('r7') ?? 0);
      results = [r0+200, r1+200, r2+100, r3+100, r4+100, r5+100, r6+200, r7+200];
    });
  }

    _removeCounter() async {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('percentage');
      prefs.remove('startCount');
      prefs.remove('r0');
      prefs.remove('r1');
      prefs.remove('r2');
      prefs.remove('r3');
      prefs.remove('r4');
      prefs.remove('r5');
      prefs.remove('r6');
      prefs.remove('r7');
    }
  @override
  Widget build(BuildContext context) {
    _removeCounter();
    var result2 = results;
    var suggest = Suggest().ffuunn();
    var iqNames = [
      "الذكاء اللغوي اللفظي",
      "الذكاء المنطقي الرياضي",
      "الذكاء البصري المكاني",
      "الذكاء المكاني /الحركي",
      "الذكاء الاجتماعي",
      "الذكاء الذاتي / الشخصي",
      "الذكاء الايقاعي الصوتي",
      "الذكاء الطبيعي"
    ];

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8 - 1; j++) {
        if (result2[j] < result2[j + 1]) {
          var tmp = iqNames[j];
          iqNames[j] = iqNames[j + 1];
          iqNames[j + 1] = tmp;
          var tmp1 = result2[j];
          result2[j] = result2[j + 1];
          result2[j + 1] = tmp1;
          var tmp2 = suggest[j];
          suggest[j] = suggest[j + 1];
          suggest[j + 1] = tmp2;
        }
      }
    }
    var share=["نتيجة الإختبار \n"];
    for (int i = 0; i < 8; i++) {
      share.add(
          "${iqNames[i]} :% ${result2[i] / 10}+ \n ${iqNames[i]} لدي ابنك ${decideSt(result2[i] / 10)} \n\n");
    }

    var marginFixed = MediaQuery.of(context).size.width * 0.040;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: StyleCustom().bg,
          elevation: 0,
          centerTitle: true,
          leading: Container(),
          title: Text(
            "نتيجه الأختبار",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        backgroundColor: StyleCustom().bg,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        alert(context, iqNames[index], suggest[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(
                            left: marginFixed, right: marginFixed, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        //height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(4)),
                                Expanded(
                                    flex: 5,
                                    child: Text(
                                      iqNames[index] + ":",
                                      style: TextStyle(fontSize: 15),
                                    )),
                                LinearPercentIndicator(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  lineHeight: 15.0,
                                  percent: (result2[index] / 10) / 100,
                                  center: Text(
                                    "% ${result2[index] / 10}",
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.white),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: colorIn(result2[index] / 10),
                                  progressColor: colorOut(result2[index] / 10),
                                ),
                                Padding(padding: EdgeInsets.all(4)),
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    right: 20, left: 12, top: 3),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "- ${iqNames[index]} لدي ابنك ${decideSt(result2[index] / 10)}",
                                      style: TextStyle(
                                          letterSpacing: -1,
                                          fontSize: 13,
                                          color: Colors.black54),
                                    ),
                                    Text("للمزيد",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: StyleCustom().mainBlue,
                                            decoration:
                                                TextDecoration.underline))
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              height: 65.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Share.share(share.toString());
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: marginFixed, bottom: marginFixed),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: StyleCustom().mainBlue,
                              size: 15,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              "مشاركة النتيجة",
                              style: TextStyle(
                                letterSpacing: -2,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: StyleCustom().mainBlue),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: marginFixed / 4,right: marginFixed / 4, bottom: marginFixed),
                        height: 80.0,
                        decoration: BoxDecoration(
                            color: StyleCustom().mainBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 16,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text("الرئيسية",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        savePdf(results);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: marginFixed, bottom: marginFixed),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.picture_as_pdf,
                              color: StyleCustom().mainBlue,
                              size: 15,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              "حفظ النتيجة",
                              style: TextStyle(letterSpacing: -2,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: StyleCustom().mainBlue),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

decideSt(var x) {
  if (x >= 85) {
    return "ممتاز";
  } else if (x < 85 && x >= 70) {
    return "جيد جداً";
  } else if (x < 70 && x >= 55) {
    return "جيد";
  } else if (x < 55 && x >= 40) {
    return "مقبول";
  } else {
    return "ضعيف";
  }
}

colorIn(var x) {
  if (x < 55) {
    return StyleCustom().downRed;
  } else if (x >= 55 && x < 70) {
    return StyleCustom().downSilver;
  } else if (x >= 70 && x < 85) {
    return StyleCustom().downYellow;
  } else {
    return StyleCustom().downGreed;
  }
}

colorOut(var x) {
  if (x < 55) {
    return StyleCustom().upRed;
  } else if (x >= 55 && x < 70) {
    return StyleCustom().upSilver;
  } else if (x >= 70 && x < 85) {
    return StyleCustom().upYellow;
  } else {
    return StyleCustom().upGreen;
  }
}

void alert(BuildContext context, var title, var answer) {
  var alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
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
            Container(
                alignment: Alignment(0, 0),
                padding: EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height * 0.57,
                color: StyleCustom().bg,
                child: Scrollbar(
                  child: ListView(children: <Widget>[answer]),
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
