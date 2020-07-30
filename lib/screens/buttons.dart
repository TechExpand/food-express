import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Schedule extends StatefulWidget {
  static const String routeName = "/schedule";

  ScheduleState createState() => new ScheduleState();
}

List<ModelVO> data = new List();

enum SingleGame { $game, $home, $away, $selectedValue }

class ScheduleState extends State<Schedule> {
  final formKey = GlobalKey<FormState>();
  var _pick;
  var _picks;
  String _game, _tiebreaker;
  static List<String> _selectedpicksList1 = [];
  static List<String> _selectedpicksList2 = [];
  List final_list = _selectedpicksList1 + _selectedpicksList2;

  // var selectedpicksList = new List<String>();
  // var _selectedIndex =String;
// List <String> selectedpicksList = ();
  // forEach (SingleGame){
  //   selectedpicksList.add(SingleGame.$selectedValue );
  // }

  /// might need to add picks here
  TextEditingController tiebreakerController = TextEditingController();

  Future<String> getJson() async {
    var response = await http.get(
        Uri.encodeFull("https://sheetdb.io/api/v1/red9m0vfm55hy"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      List strList = json.decode(response.body) as List;
      data = strList.map((model) => ModelVO.fromJson(model)).toList();
    });

    print("schedule imported successfully!");
  } //

  @override
  void initState() {
    this.getJson();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = new Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Form(
                key: formKey,
                child: new CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: <Widget>[
                    const SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text('Week: 1'),
                      ),
                    ),

                    // the games are here
                    SliverFixedExtentList(
                      itemExtent: 200.0,
                      delegate: SliverChildBuilderDelegate(
                        (
                          BuildContext context,
                          i,
                        ) {
                          // radiolisttile  radio buttons *** ///
                          return new Column(
                            children: <Widget>[
                              new Text(
                                  "GAME: ${data[i].game} ${data[i].away.toUpperCase()} at ${data[i].home.toUpperCase()} "),

                              RadioListTile<SingleGame>(
                                subtitle: new Text('record 3- 1'),
                                title:
                                    new Text("${data[i].home.toUpperCase()}"),
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: SingleGame.$home,
                                groupValue: data[i].selectedValue,
                                activeColor: Colors.green,
                                onChanged: (SingleGame value) {
                                  setState(() {
                                    data[i].selectedValue = SingleGame.$home;
                                    _pick = data[i].home;
                                    _selectedpicksList1.add(_pick.toString());
                                    print(_pick);
                                  });
                                },
                                selected:
                                    data[i].selectedValue == SingleGame.$home,
                              ),
                              ////
                              ///
                              RadioListTile<SingleGame>(
                                subtitle: const Text('record 2- 1'),
                                title:
                                    new Text("${data[i].away.toUpperCase()}"),
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: SingleGame.$away,
                                groupValue: data[i].selectedValue,
                                activeColor: Colors.green,
                                onChanged: (SingleGame value) {
                                  setState(() {
                                    data[i].selectedValue = SingleGame.$away;
                                    _picks = data[i].away;
                                    _selectedpicksList2.add(_picks.toString());
                                    print(_picks);
                                  });
                                },
                                selected:
                                    data[i].selectedValue == SingleGame.$away,
                              ),

                              const Divider(
                                color: Colors.blueGrey,
                                height: 25.0,
                              ),
                              // new Text("trailing comment"),
                            ],
                          ); // radio list tile column
                        },
                        childCount: data == null ? 0 : data.length,
                      ),
                    ),

                    // the total score and submit button here
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            color: Colors.green[50],
                            height: 150.0,
                            padding: new EdgeInsets.all(50.0),
                            child: new TextFormField(
                              controller: tiebreakerController,

                              onSaved: (input) => _tiebreaker = input,

                              obscureText: false,
                              // Use secure text for passwords.
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                  hintText: 'Tie Breaker Score',
                                  labelText: 'Total Score Tie Breaker'),
                              validator: (val) => val.isEmpty
                                  ? 'Tie Breaker can\'t be empty.'
                                  : null,
                            ),
                          ),
                          Container(
                            color: Colors.purple[50],
                            height: 50.0,
                            child: new RaisedButton(
                              child: new Text(
                                'Enter Your Picks!',
                                style: new TextStyle(color: Colors.black),
                              ),
                              elevation: 4.0,
                              splashColor: Colors.green[300],
                              onPressed: () => _submit(),
                              color: Colors.green[50],
                            ),
                            margin: new EdgeInsets.all(50),
                          ),
                          Container(color: Colors.green, height: 150.0),
                        ],
                      ),
                    )
                  ],
                ) //csv

                ) //form end
            ));

    return scaffold;
  } //

  void _submit() {
    //if(formKey.currentState.validate()){
    //  if (formKey.currentState == null || !formKey.currentState.validate()) {
    //   return;

    final form = formKey.currentState;
    if (form.validate()) {
      formKey.currentState.save();
      form.save();

      // var _selectedpicksList= <String>[];
      // var _picks = <String>[ SingleGame[].${selectedValue}];
      // elements.add('fluorine');
      // _selectedpicksList.addAll(_picks);
      print(_selectedpicksList1);
      print(_selectedpicksList2);
      print(final_list.toSet().toList());
      print("working submit button!");
      //print(form);
      // print(SingleGame.$game);
      // print(_weekspicks);

      // print(_selectedpicksList);
      print("teams picked:  tie breaker:${tiebreakerController.text}");
    }
  }
}

///

class ModelVO {
  String game;
  String home;
  String away;
  String winner;
  String score;
  SingleGame selectedValue;

  ModelVO(
      {this.game,
      this.home,
      this.away,
      this.winner,
      this.score,
      this.selectedValue});

  factory ModelVO.fromJson(Map<String, dynamic> parsedJson) {
    return ModelVO(
      game: parsedJson['game'],
      home: parsedJson['home'],
      away: parsedJson['away'],
      winner: parsedJson['winner'],
      score: parsedJson['score'],
      selectedValue: parsedJson['selectedValue'],
    );
  }

  Map toJson() => {
        "game": game,
        "home": home,
        "away": away,
        "winner": winner,
        "score": score,
        "selectedValue": selectedValue,
      };
}
