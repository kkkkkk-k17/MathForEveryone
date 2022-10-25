import 'package:flutter/material.dart';
import 'package:three_pam/secondPage.dart';

import 'main.dart';

class FinalRoute extends StatefulWidget {
  final Results data;
  const FinalRoute({Key? key, required this.data}) : super(key: key);

  @override
  FinalRouteState createState() => FinalRouteState();

}

class FinalRouteState extends State<FinalRoute> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 342,
        height: 318,
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: const Color.fromRGBO(240, 240, 240, 1)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: <Widget> [
             const Text(
              'New Rating',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(146, 146, 146, 1),
                  height: 1.7),
            ),
             Text(
              '${widget.data.rating}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  height: 1.7),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:  <Widget>[
                 Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Score\n',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(146, 146, 146, 1),
                        height: 3,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.data.score}/15',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              height: 1),
                        )
                      ],
                    )),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Correct\n',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(146, 146, 146, 1),
                          height: 3),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.data.correct}/5',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              height: 1),
                        )
                      ],
                    )),
                 Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: 'Completed In\n',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(146, 146, 146, 1),
                          height: 3),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.data.time}s',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              height: 1),
                        )
                      ],
                    ))
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(
                                title: '',
                              )),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(240, 240, 240, 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(120, 12, 120, 12)),
                  ),
                  child: const Text(
                    'Leave',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
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
                      const EdgeInsets.fromLTRB(104, 12, 104, 12)),
                ),
                child: const Text('New Game'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
