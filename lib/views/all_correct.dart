import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class AllCorrectPage extends StatefulWidget {
  const AllCorrectPage({Key? key}) : super(key: key);

  @override
  State<AllCorrectPage> createState() => _AllCorrectPageState();
}

class _AllCorrectPageState extends State<AllCorrectPage> {
  final _myBox = Hive.box('myBox');

  String playerName = '';

  final player = AudioPlayer();

  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    bool? isAudio = (_myBox.get(2));
    final List args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    String correctState = args[0];
    String? stateCap = args[1];
    //print('isAudio-ac $isAudio');
    if (isAudio != false) {
      player.play(AssetSource('success-fanfare-trumpets.mp3'));
    }
    playerName = (_myBox.get(1));
    int numCorrect = (_myBox.get(3));
    int numIncorrect = (_myBox.get(4));

    setState(() {
      numCorrect++;
    });
    _myBox.put(3, numCorrect);
    //print('Number of correct answers $numCorrect');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Correct Answer!'),
        automaticallyImplyLeading: false,
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/states_name/$correctState.png'),
            Text(
              'You GotThe Right Answer $playerName!!\n$correctState\nState Capitol $stateCap',
              style: const TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text('Next State'),
              onPressed: () {
                Navigator.of(context).pushNamed('/page_one');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Correct = $numCorrect',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Incorrect = $numIncorrect',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// © 2022 SimCon All Rights Reserved