import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/views/page_one.dart';
import 'views/all_correct.dart';
import 'views/correct.dart';

import 'views/start.dart';
import 'views/wrong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize Hive
  await Hive.initFlutter();
  String playerName = 'Player';
  int correctAnswer = 0;
  int incorrectAnswer = 0;
  // open the box
  var box = await Hive.openBox('myBox');
  box.put(1, playerName);
  box.put(3, correctAnswer);
  box.put(4, incorrectAnswer);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const StartPage(),
        '/page_one': (context) => const PageOne(),
        '/correct': (context) => const CorrectPage(),
        '/all_correct': (context) => const AllCorrectPage(),
        '/wrong': (context) => const WrongPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      //onGenerateRoute: route.controller,
      //initialRoute: route.pageOne,
    );
  }
}
//© 2022 SimCon All Rights Reserved