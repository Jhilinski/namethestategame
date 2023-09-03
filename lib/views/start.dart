import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final TextEditingController _playerTextController = TextEditingController();

  String playerName = 'Player';
  String savedName = 'Player';
  bool? checkBoxValue = true;

  //reference our box
  final _myBox = Hive.box('myBox');
  void closeAppUsingSystemPop() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (bool? value) {
                          //print(value);
                          setState(() {
                            checkBoxValue = value;
                            _myBox.put(2, checkBoxValue);
                          });
                        },
                      ),
                      const Text('Audio?'),
                    ],
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
                      //onChanged is called whenever we add or delete something on Text Field
                      onSubmitted: (String str) {
                        setState(() {
                          playerName = str;
                          _myBox.put(1, playerName);
                          savedName = (_myBox.get(1));
                        });
                      }),
                  //displaying input text
                  //new Text(playerName),

                  const SizedBox(height: 5.0),

                  ElevatedButton(
                    child: const Text('Start'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/page_one');
                    },
                  )
                ]),
          ),
        ));
  }
}
