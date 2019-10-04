import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../data/quizData.dart';
import 'package:flutter_tags/selectable_tags.dart';
import './quizResult.dart';

class Quiz extends StatefulWidget {
  Quiz({Key key}) : super(key: key);

  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int percentage = 10;
  int startCount = 0;
  int r0 = 0;
  int r1 = 0;
  int r2 = 0;
  int r3 = 0;
  int r4 = 0;
  int r5 = 0;
  int r6 = 0;
  int r7 = 0;

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
      percentage = (prefs.getInt('percentage') ?? 10);
      startCount = (prefs.getInt('startCount') ?? 0);
      r0 = (prefs.getInt('r0') ?? 0);
      r1 = (prefs.getInt('r1') ?? 0);
      r2 = (prefs.getInt('r2') ?? 0);
      r3 = (prefs.getInt('r3') ?? 0);
      r4 = (prefs.getInt('r4') ?? 0);
      r5 = (prefs.getInt('r5') ?? 0);
      r6 = (prefs.getInt('r6') ?? 0);
      r7 = (prefs.getInt('r7') ?? 0);
    });
  }

  var results;

  var x = QuizQ().quizQ;

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _loadCounter();
    wait();
    results = [r0, r1, r2, r3, r4, r5, r6, r7];
    var colors = [
      StyleCustom().blue,
      StyleCustom().rose,
      StyleCustom().orange,
      StyleCustom().silver
    ];
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
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: Text("أختبر طفلك",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ))),
        backgroundColor: StyleCustom().bg,
        body: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(marginFixed),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - (marginFixed * 2),
              lineHeight: 18.0,
              percent: percentage / 100,
              center: Text(
                "% $percentage",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: StyleCustom().blue,
              progressColor: StyleCustom().mainBlue,
            ),
          ),
          Container(
              alignment: Alignment(0, 0),
              child: Text(
                "ملاحظة: يمكنك التوقف عند اى صفحة وإكمال التقييم لاحقاً",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal,color: Colors.red),textAlign: TextAlign.center
              )),
          Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  addAutomaticKeepAlives: true,
                  itemCount: x.length,
                  itemBuilder: (context, index) {
                    if (index < startCount + 8 && index >= startCount) {
                      List<Tag> _tags = [
                        Tag(id: 3, title: '3', active: ccc(index, x, 3)),
                        Tag(id: 2, title: '2', active: ccc(index, x, 2)),
                        Tag(id: 1, title: '1', active: ccc(index, x, 1)),
                        Tag(id: 0, title: '0', active: ccc(index, x, 0)),
                      ];
                      return Column(children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15.0),
                            width: MediaQuery.of(context).size.width -
                                (marginFixed * 2),
                            margin: EdgeInsets.only(top: 15.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0))),
                            child: Text(
                              "${index + 1}- ${x[index][0]}",
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width -
                                (marginFixed * 2),
                            height: 45.0,
                            decoration: BoxDecoration(
                                color: colors[index % 4],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                            child: Column(children: <Widget>[
                              SelectableTags(
                                  margin: EdgeInsets.only(
                                      right: marginFixed * 0.5,
                                      left: marginFixed * 0.6),
                                  backgroundContainer: Colors.transparent,
                                  activeColor: Colors.white,
                                  color: colors[index % 4],
                                  textActiveColor: Colors.black,
                                  singleItem: true,
                                  tags: _tags,
                                  columns: 4, // default 4
                                  symmetry: true, // default false
                                  onPressed: (tag) {
                                    setState(() {
                                      if (tag.id == 0) {
                                        x[index][1] = 10;
                                      } else if (tag.id == 1) {
                                        x[index][1] = 40;
                                      } else if (tag.id == 2) {
                                        x[index][1] = 70;
                                      } else if (tag.id == 3) {
                                        x[index][1] = 100;
                                      }
                                      debugPrint(x[index][1].toString());
                                      //saveResults(x, index);
                                    });
                                  })
                            ]))
                      ]);
                    } else {
                      return Container();
                    }
                  }))
        ]),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      flex: 8,
                      child: Container(
                        height: 10.0,
                      )),
                  Expanded(
                      flex: 5,
                      child: GestureDetector(
                          onTap: () {
                            debugPrint(results.toString());
                            int z = 0;
                            if (percentage == 100) {
                              for (int i = startCount;
                                  i < startCount + 8;
                                  i++) {
                                if (x[i][1] == 0) {
                                  alert(context, i + 1);
                                  z = 0;
                                  break;
                                } else {
                                  z++;
                                }
                              }
                              if (z == 8) {
                                for (int i = startCount;
                                    i < startCount + 8;
                                    i++) {
                                  results[x[i][2]] += x[i][1];
                                  if (x[i][2] == 0) {
                                    prefs.setInt('r0', r0 + x[i][1]);
                                  } else if (x[i][2] == 1) {
                                    prefs.setInt('r1', r1 + x[i][1]);
                                  } else if (x[i][2] == 2) {
                                    prefs.setInt('r2', r2 + x[i][1]);
                                  } else if (x[i][2] == 3) {
                                    prefs.setInt('r3', r3 + x[i][1]);
                                  } else if (x[i][2] == 4) {
                                    prefs.setInt('r4', r4 + x[i][1]);
                                  } else if (x[i][2] == 5) {
                                    prefs.setInt('r5', r5 + x[i][1]);
                                  } else if (x[i][2] == 6) {
                                    prefs.setInt('r6', r6 + x[i][1]);
                                  } else if (x[i][2] == 7) {
                                    prefs.setInt('r7', r7 + x[i][1]);
                                  }
                                  prefs.setInt('percentage', 110);
                                }
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            QuizResult(result: results)));
                              }
                            } else {
                              for (int i = startCount;
                                  i < startCount + 8;
                                  i++) {
                                if (x[i][1] == 0) {
                                  alert(context, i + 1);
                                  z = 0;
                                  break;
                                } else {
                                  z++;
                                }
                              }
                              if (z == 8) {
                                for (int i = startCount;
                                    i < startCount + 8;
                                    i++) {
                                  results[x[i][2]] += x[i][1];
                                  if (x[i][2] == 0) {
                                    prefs.setInt('r0', r0 + x[i][1]);
                                  } else if (x[i][2] == 1) {
                                    prefs.setInt('r1', r1 + x[i][1]);
                                  } else if (x[i][2] == 2) {
                                    prefs.setInt('r2', r2 + x[i][1]);
                                  } else if (x[i][2] == 3) {
                                    prefs.setInt('r3', r3 + x[i][1]);
                                  } else if (x[i][2] == 4) {
                                    prefs.setInt('r4', r4 + x[i][1]);
                                  } else if (x[i][2] == 5) {
                                    prefs.setInt('r5', r5 + x[i][1]);
                                  } else if (x[i][2] == 6) {
                                    prefs.setInt('r6', r6 + x[i][1]);
                                  } else if (x[i][2] == 7) {
                                    prefs.setInt('r7', r7 + x[i][1]);
                                  }
                                }
                                //debugPrint(results.toString());
                                setState(() {
                                  _scrollController.animateTo(
                                    0.0,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                  percentage += 10;
                                  startCount += 8;
                                  prefs.setInt('startCount', startCount);
                                  prefs.setInt('percentage', percentage);
                                });
                              }
                            }
                            debugPrint(results.toString());
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: marginFixed, bottom: marginFixed),
                              height: 55.0,
                              decoration: BoxDecoration(
                                  color: StyleCustom().mainBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("التالى",
                                        style: TextStyle(color: Colors.white)),
                                    Icon(
                                      Icons.arrow_right,
                                      color: Colors.white,
                                    )
                                  ]))))
                ])));
  }

  saveResults(var questions, int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (questions[count][2] == 0 && questions[count][3] == 0) {
      prefs.setInt('r0', r0 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 1 && questions[count][3] == 0) {
      prefs.setInt('r1', r1 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 2 && questions[count][3] == 0) {
      prefs.setInt('r2', r2 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 3 && questions[count][3] == 0) {
      prefs.setInt('r3', r3 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 4 && questions[count][3] == 0) {
      prefs.setInt('r4', r4 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 5 && questions[count][3] == 0) {
      prefs.setInt('r5', r5 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 6 && questions[count][3] == 0) {
      prefs.setInt('r6', r6 + questions[count][1]);
      questions[count][3] = 1;
    } else if (questions[count][2] == 7 && questions[count][3] == 0) {
      prefs.setInt('r7', r7 + questions[count][1]);
      questions[count][3] = 1;
    }
  }
}

void alert(BuildContext context, int ans) {
  var alertDialog = AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content: Container(
          height: 50,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.assignment,
                  size: 15,
                ),
                Text(
                  "من فضلك أجب على السؤال رقم $ans",
                  style: TextStyle(fontSize: 14),
                ),
              ])));
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

bool ccc(int i, var z, int tag) {
  if (z[i][1] == 10 && tag == 0) {
    return true;
  } else if (z[i][1] == 40 && tag == 1) {
    return true;
  } else if (z[i][1] == 70 && tag == 2) {
    return true;
  } else if (z[i][1] == 100 && tag == 3) {
    return true;
  } else {
    return false;
  }
}
