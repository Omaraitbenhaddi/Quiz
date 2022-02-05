import 'package:flutter/material.dart';

String quiz_flutter = 'Quiz flutter';
String commencer = 'commencer le quiz';
Text quitter() {
  return Text('quitter le jeux ');
}

Text afficher_score(int score) {
  return Text('score : $score ');
}

Text afficher_num_question(int index) {
  return Text(
    'Question numero : ${index + 1}/10',
    style: TextStyle(fontSize: 18),
  );
}

Text vrai_faux(bool b) {
  return Text((b) ? 'vrai' : 'faux');
}

Text message_resultet_reponse(bool resReponse) {
  return Text(
    (resReponse)
        ? 'exactement tres bien'
        : 'malheureusement continue tu est proche',
  );
}

Text fini() {
  return Text('C\'est fini');
}

Text message_fini(int score) {
  return Text(
      ' bon travaille tu as obtenu $score point \n continuer a travailler pour contunier a se developer');
}

Text relancer() {
  return Text('relance le jeux');
}

Text passer_question_suivant() {
  return Text('passer a la question suivant');
}
