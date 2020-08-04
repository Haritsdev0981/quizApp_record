import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffc2185b), // 0xff untuk opacity
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Quiz",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text('App'),
            ],
          ),
        ),
        body: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            //padding kana kiri 8, atas bawah 4
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueGrey,
              ),
              child: Text(
                '4/10',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Apa benar, Nyengir itu kalo udh pegel jadi nyender?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    //raunded biar kgk kotak melengkung gitu
                    borderRadius: BorderRadius.circular(20.0),
                    //side untuk pinggir,, disini untuk pingiran pada button
                    side: BorderSide(color: Colors.red),
                  ),
                  color: Colors.red,
                  child: Text(
                    'SALAH',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    //raunded biar kgk kotak melengkung gitu
                    borderRadius: BorderRadius.circular(20.0),
                    //side untuk pinggir,, disini untuk pingiran pada button
                    side: BorderSide(color: Colors.greenAccent),
                  ),
                  color: Colors.green,
                  child: Text(
                    'Benar',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
