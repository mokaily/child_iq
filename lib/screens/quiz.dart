import 'package:flutter/material.dart';
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
  var results = [0, 0, 0, 0, 0, 0, 0, 0];
  int startCount = 0;
  var x = QuizQ().quizQ;

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
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
                                      //saveResults(x);
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
                                });
                              }
                            }
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
