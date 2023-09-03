//import '/views/page_one.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _playerTextController = TextEditingController();

  String playerName = 'Player';
  String savedName = '';

  //reference our box
  final _myBox = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Name The State Game'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Hello! $playerName',
                  style: const TextStyle(fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/images/states_no_name/USA Color Mao No Names300.png',
                ),
                const Text(
                  'Do You Know Your State Shape?',
                  style: TextStyle(fontSize: 20.0),
                ),

                //Text('Saved Name $savedName'),
                TextField(
                  textAlign: TextAlign.center,
                  controller: _playerTextController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    border: OutlineInputBorder(),
                    hintText: 'Type Your Name!',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playerName = _playerTextController.text;
                      _myBox.put(1, playerName);
                    });
                    savedName = (_myBox.get(1));
                  },
                  child: const Text('Enter Player Name'),
                ),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  child: const Text('Start'),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/page_one');
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
