import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:training_quiz/question_logic.dart';

QuestionLogic questionLogic = QuestionLogic(); //untuk memanggil ke dart.main

void main() {
  // main runApp itu seperti jika ingin memunculkan layar mana dluan,, atau kurang lebih seperti di JAVA yaitu Manifest
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowCheckedModeBanner itu jika kita pilih FALSE maka saat dirun tidak akan muncul tulisan DEBUG di samping kanan atas jika TRUE maka muncul
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
  List<Widget> scoreResult = [
    Text(
      'Hasil',
      style: TextStyle(color: Colors.white),
    )
  ];

  void checkAnswer(bool answer) {
    bool correctAnswer = questionLogic.getCorrectAnswer();

    setState(() {
      if (questionLogic.isFinished()) {
        Alert( // fungsinya klo udh selese sampai soal terakhir maka selesai dan muncul proses yg ada dibawah ini
            context: context,
            type: AlertType.success,
            title: 'Quiz Selese',
            desc: 'Mulai Ulang Quiz',
            buttons: [
              DialogButton(
                child: Text('FINISH',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120.0,
              ),
            ]
        ).show();
        questionLogic.resetQuestion();
        scoreResult.clear();
      } else { //scoreResult untuk memberi tanda jika jawaban benar atau salah
        if (answer == correctAnswer) {
          scoreResult.add(Icon(Icons.check, color: Colors.green,));
        } else {
          scoreResult.add(Icon(Icons.close, color: Colors.red,));
        }
        questionLogic.nextQuestion();
      }
    });
  }

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
            //padding kanan kiri 8, atas bawah 4
            child: Row( // ketika di run jika jawaban kita benar akan muncul icon benar,, jika jawaban salah maka akan muncul icon salah
                children: scoreResult
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
              child: Text( //cara untuk mengambil mepermudah,, jadi akan muncul angka otomatis mengikuti soal
                questionLogic.getQuestionNumberText().toString()
                    + '/' +
                    questionLogic.getTotalQuestionText().toString(),
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
              child: Text( // cara agar ganti ganti pertanyaannya
                questionLogic.getQuestion(),
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
                    'NO',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
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
                    'Yes',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// hanya untuk mengingat Color-> Colors (pasangan nya)
// hanya untuk mengingat Icon -> Icons (pasangannya)