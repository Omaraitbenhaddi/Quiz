import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/screen/quiz_page.dart';
import 'package:quiz/string/string.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz_flutter),
      ),
      body: Center(
        child: Card(
          color: Colors.grey.shade600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/cover.jpg',
                  height: size.height / 1.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (BuildContext ctx) {
                        return QuizPage();
                      }));
                    },
                    child: Text(commencer),
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 60)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: quitter(),
                    style: ElevatedButton.styleFrom(minimumSize: Size(100, 60)),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
            ],
          ),
        ),
      ),
    );
  }
}
