import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:three_pam/finalPage.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => SecondRouteState();
}

class Intrebare {
  String ask;
  List<Answer> answers;
  int correct;

  Intrebare({required this.ask, required this.answers, required this.correct});
}

class Answer {
  int ans;
  bool value;

  Answer({required this.ans, required this.value});
}

class Results {
  int rating;
  int score;
  int correct;
  int time;

  Results(
      {required this.rating,
      required this.score,
      required this.correct,
      required this.time});
}

class SecondRouteState extends State<SecondRoute> {
  double percent = 0.0;
  late Timer timer;
  int index = 0;
  final Results results = Results(rating: 0, score: 0, correct: 0, time: 0);

  List<Intrebare> intrebari = [
    Intrebare(
        ask:
            'A letter lock consists of three rings, each marked with ten different letters. In how many ways is it possible to make an unsuccessful attempt to open the lock?',
        answers: [
          Answer(ans: 15500, value: false),
          Answer(ans: 12540, value: false),
          Answer(ans: 11503, value: false),
          Answer(ans: 14250, value: false),
        ],
        correct: 15500),
    Intrebare(
        ask:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
        answers: [
          Answer(ans: 1, value: false),
          Answer(ans: 2, value: false),
          Answer(ans: 3, value: false),
          Answer(ans: 4, value: false),
        ],
        correct: 2),
    Intrebare(
        ask:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
        answers: [
          Answer(ans: 1, value: false),
          Answer(ans: 2, value: false),
          Answer(ans: 3, value: false),
          Answer(ans: 4, value: false),
        ],
        correct: 3),
    Intrebare(
        ask:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
        answers: [
          Answer(ans: 1, value: false),
          Answer(ans: 2, value: false),
          Answer(ans: 3, value: false),
          Answer(ans: 4, value: false),
        ],
        correct: 3),
    Intrebare(
        ask:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
        answers: [
          Answer(ans: 1, value: false),
          Answer(ans: 2, value: false),
          Answer(ans: 3, value: false),
          Answer(ans: 4, value: false),
        ],
        correct: 3)
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        percent += 1;
        if (percent >= 100) {
          getResults();
          timer.cancel();
          percent = 0.0;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FinalRoute(
                      data: results,
                    )),
          );
        }
      });
    });
  }

  getResults() {
    setState(() {
      results.time = percent.toInt();
    });
    intrebari.forEach((Intrebare item) {
      item.answers.forEach((Answer el) {
        if (el.value == true) {
          if (el.ans == item.correct) {
            setState(() {
              results.correct += 1;
              results.rating = results.rating + 3;
              results.score = results.score + 3;
            });
          } else {
            setState(() {
              results.rating -= 2;
              results.score -= 1;
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.timelapse,
                      color: Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                    Text(
                      ' ${100 - percent.toInt()}sec',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(123, 123, 123, 1),
                      ),
                    ),
                  ]),
            ),
            Container(
              width: 350,
              margin: const EdgeInsets.only(bottom: 44.0),
              child: LinearPercentIndicator(
                width: 342,
                lineHeight: 10.0,
                percent: percent / 100,
                animateFromLastPercent: true,
                barRadius: const Radius.circular(10),
                backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
                progressColor: const Color.fromRGBO(11, 188, 0, 1),
                animation: true,
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 24.0),
              child: Text.rich(
                TextSpan(
                    text: 'Question ${index + 1} of 5\n',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(123, 123, 123, 1),
                        height: 1.7),
                    children: <TextSpan>[
                      TextSpan(
                        text: intrebari[index].ask,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(37, 44, 50, 1),
                        ),
                      ),
                    ]),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 32.0),
              child: Column(
                  children: intrebari[index].answers.map((Answer item) {
                return Container(
                  height: 54,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: CheckboxListTile(
                    shape: const CircleBorder(),
                    title: Text(item.ans.toString()),
                    value: item.value,
                    onChanged: (bool? value) {
                      setState(() {
                        item.value = !item.value;
                      });
                    },
                  ),
                );
              }).toList()),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: ElevatedButton(
                onPressed: () {
                  if (index + 1 < intrebari.length) {
                    setState(() {
                      index += 1;
                    });
                  } else {
                    getResults();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FinalRoute(data: results)),
                    );
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(37, 44, 50, 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(130, 12, 130, 12)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14))),
                child: const Text('Next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
