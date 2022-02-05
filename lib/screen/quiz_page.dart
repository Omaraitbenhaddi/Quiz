import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/model/data.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/string/string.dart';
//import 'package:quiz/screen/buton_vrai_faux.dart';

class QuizPage extends StatefulWidget {
  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  List<Question> questions = Datas().listeQuestions;
  int score = 0;
  int index = 0;

  get t => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final question = questions[index];
    return Scaffold(
      appBar: AppBar(
        title: afficher_score(score),
      ),
      body: Center(
        child: Card(
          color: Colors.grey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              afficher_num_question(index),
              Text(
                question.question,
                style: TextStyle(fontSize: 15),
              ),
              Image.asset(
                question.getImage(),
                height: size.height * 0.6,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button_confir(true),
                    Padding(padding: EdgeInsets.only(left: size.width * 0.25)),
                    button_confir(false),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton button_confir(bool b) {
    return ElevatedButton(
        onPressed: () {
          checkAnswer(b);
        },
        child: vrai_faux(b),
        style: ElevatedButton.styleFrom(
            primary: (b) ? Colors.green : Colors.red,
            minimumSize: Size(100, 60)));
  }

  checkAnswer(bool b) {
    final question = questions[index];
    final resReponse = (b == question.reponse);
    if (resReponse) {
      setState(() {
        score++;
      });
    }
    showAnswer(resReponse);
  }

  Future<void> showAnswer(bool resReponse) async {
    String pathimage = (resReponse) ? 'assets/vrai.jpg' : 'assets/faux.jpg';
    Size size = MediaQuery.of(context).size;
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: message_resultet_reponse(resReponse),
            children: [
              Image.asset(
                pathimage,
                height: size.height * 0.7,
              ),
              Center(child: Text(questions[index].explication)),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    if (index < 9) {
                      index++;
                      setState(() {});
                    } else {
                      return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: fini(),
                              content: message_fini(score),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      score = 0;
                                      index = 0;
                                      setState(() {});
                                    },
                                    child: relancer()),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: quitter())
                              ],
                            );
                          });
                    }
                  },
                  child: passer_question_suivant(),
                ),
              ),
            ],
          );
        });
  }
}
