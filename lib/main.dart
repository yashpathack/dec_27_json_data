import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              //Decode JSON
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                    elevation: 4.0,
                    color: Colors.transparent,
                    //shape: ShapeBorder.lerp(Red, Blue, 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Name:" + mydata[index]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Age:" + mydata[index]['age'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Height:" + mydata[index]['height'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Hair Color:" +
                                            mydata[index]['hair colors'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Gender:" + mydata[index]['gender'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                              ],
                            ))
                        // Text("Life Expectancy") + mydata[index][]
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }

  //decode() => JSON;
}
