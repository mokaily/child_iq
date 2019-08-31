import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/quiz.dart';
import 'screens/quizResult.dart';
import 'screens/CommonQ.dart';
import 'screens/why.dart';
import 'screens/about.dart';
import 'screens/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      locale: Locale("ar", "AE"),
      debugShowCheckedModeBanner: false,
      title: 'aio note',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Myriad-Pro',
      ),
      routes: {
        '/Quiz': (context) => Quiz(),
        '/QuizResult': (context) => QuizResult(),
        '/CommonQ' : (context) => CommonQ(),
        '/WhyQ' : (context) => WhyQ(),
        '/AboutMe' : (context) => AboutMe(),
        '/ContactMe' : (context) => ContactMe(),
      },
      home: Home(),
    );
  }
}
