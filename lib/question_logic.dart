import 'package:training_quiz/question.dart';

class QuestionLogic {
  // penamaan variabel lokal harus diawali dengan _
  //sebagai index dari array(_questionNumber) index mulai dari 0
  int _questionNumber = 0;

  //list ini untuk membuat pertanyaan dan true false nya itu sebagai jawaban
  List<Question> _questionList = [
    //data array untuk mengisi model question
    Question('Is it true, that grin when its already sore, it becomes tender?',
        false),
    Question(
        'Is it true that you want to get fast, dont get too much skin', true),
    Question('Is Ling really good skin?', true),
    Question('Is it true that Lunox is a trash hero?', true),
    Question('Is it true that the X-box Hero OP?', true),
    Question('Is it true that Epic can carry Legend?', true),
    Question('Is it true that Cwi can make LoseStreak?', true),
    Question('Is it true that Junior NBK Burden?', false),
    Question('Is it true that AFK GOOD', false),
    Question('Is it true?', false),
  ];

  /*//fungsi dari penggambilan variabel getQuestion adalah untuk menggambil question didalam _questionList
  sesuai dengan dengan index dari questionNumber*/
  String getQuestion() => _questionList[_questionNumber].question;

  //fungsi untuk menegetahui sampai mana index sekarang,, atau mengatur angka pada soal
  int getQuestionNumberText() => _questionNumber + 1;

  //fungsi dari pemanggilan gwtTotalQuestion adalah untuk mengambil jumlah data yang ada di _questionList
  int getTotalQuestionText() => _questionList.length;

  bool getCorrectAnswer() => _questionList[_questionNumber].answer;

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
      print(_questionNumber);
      //jadi klo dipencet next pertanyaan dia bakal pintah gitu angka nya naek 0-9/1-10
      //bisa nambah atau pindah angkanya dan pertanyaannya
    }
  }

  /*//ketika questionNumber lebih besar atau sama dengan sembilan(_questionList -1) maka isFinished
   maka akan retun true jika blum akan retun false*/
  bool isFinished() {
    if (_questionNumber >= _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() => _questionNumber = 0;
// nanti di reset atau dari ulang
}
