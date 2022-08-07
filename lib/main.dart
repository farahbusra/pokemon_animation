import 'package:flutter/material.dart';
import 'moving_rocks.dart';
import 'jumping.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Jumping Pikachu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pika GO!'), centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top:190, left: 100),
        child: Column(
          children: <Widget>[
            Container(
              // margin: EdgeInsets.all(5),
            // child: Image.asset('assets/images/staypikachu.png',
            height: 100,
            width: 100,
          child: jumpingPika(),
            ),

            Container(
              margin: EdgeInsets.only(top:70),
              padding: EdgeInsets.all(50),
              child: movingRocks(),
            ),

            ElevatedButton(
              onPressed: () {
                jumpingPika();
              },
              child: Text('Jump!'),
            ),
          ],

        ),


      ),



      );
  }
}
