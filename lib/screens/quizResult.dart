import 'package:flutter/material.dart';
import '../data/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../data/suggest.dart';
import '../data/savePdf.dart';

class QuizResult extends StatelessWidget {
  
  final result;
  const QuizResult({Key key, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {  
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
        body: ListView.builder(
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
                          Expanded(flex: 5, child: Text(iqNames[index] + ":",style: TextStyle(fontSize: 15),)),
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width / 2.5,
                            lineHeight: 15.0,
                            percent: (result[index] / 10) / 100,
                            center: Text(
                              "% ${result[index] / 10}",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: colorIn(result[index] / 10),
                            progressColor: colorOut(result[index] / 10),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 20, left: 12, top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "- ${iqNames[index]} لدي ابنك ${decideSt(result[index] / 10)}",
                                style: TextStyle(letterSpacing: -1,
                                    fontSize: 13, color: Colors.black54),
                              ),
                              Text("للمزيد",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: StyleCustom().mainBlue,
                                      decoration: TextDecoration.underline))
                            ],
                          ))
                    ],
                  ),
                ),
              );
            }),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              height: 65.0,
              child: Row(
                children: <Widget>[
                  Expanded(flex: 3, child: Container()),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: marginFixed / 2, bottom: marginFixed),
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
                        savePdf(result);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: marginFixed, bottom: marginFixed),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.picture_as_pdf,
                              color: StyleCustom().mainBlue,size: 15,
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                            Text("حفظ النتيجة",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,fontSize: 13,
                                    color: StyleCustom().mainBlue),textAlign: TextAlign.right,)
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
