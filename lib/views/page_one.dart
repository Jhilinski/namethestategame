import 'package:flutter/material.dart';
//import 'dart:math';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
//reference our box
  final _myBox = Hive.box('myBox');
  int correctAnswer = 0;
  int incorrectAnswer = 0;

  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    List ourStates = [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming'
    ];

    ourStates.shuffle();
    String stateName = ourStates[0];
    var answer = stateName;
    String button2 = ourStates[1];
    String button3 = ourStates[2];
    correctAnswer = (_myBox.get(3));
    incorrectAnswer = (_myBox.get(4));
    List newButtons = [answer, button2, button3];
    //newButtons.shuffle();
    List newButtonsSC = newButtons.toList();
    //check for shuffle position
    newButtons.shuffle();
    //print('Correct Answer = $correctAnswer');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Container(height: 50.0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          title: const Text('Name The State Game'),
          actions: <Widget>[
            ElevatedButton(
              //     textColor: Colors.white,
              onPressed: () {
                closeAppUsingSystemPop();
              },
              child: const Text("Exit"),
              //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ],
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('assets/images/states_no_name/$answer.png',
                    height: 200),
                const Text(
                  'Name this State!',
                  style: TextStyle(fontSize: 20.0),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (answer == newButtons[0]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);

                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[0]),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (answer == newButtons[1]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[1]),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (answer == newButtons[2]) {
                      Navigator.of(context)
                          .pushNamed('/correct', arguments: newButtonsSC);
                      // statement(s) will execute if the Boolean expression is true.
                    } else {
                      Navigator.of(context).pushNamed('/wrong');
                      // statement(s) will execute if the Boolean expression is false.
                    }
                  },
                  child: Text(newButtons[2]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Correct = $correctAnswer',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Incorrect = $incorrectAnswer',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
