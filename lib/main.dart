import 'package:flutter/material.dart';
import 'package:three_pam/secondPage.dart';
// import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(bottom: 44.0),
                child: Image.asset('assets/images/firstimage.png')),
            const Text(
              'Math for everyone',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48.0,
                color: Color.fromRGBO(37, 44, 50, 1),
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
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
                      const EdgeInsets.fromLTRB(130, 12, 130, 12)),
                ),
                child: const Text('Start'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
