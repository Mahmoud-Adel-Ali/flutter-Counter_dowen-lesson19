//to start any Application ,you should write the code
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({super.key});

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int counter = 10;
  Timer? repeatedFunction;
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
        if (counter <= 0) {
          // timer.cancel();
          counter = 0;
        }
      });
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startTimer();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter Down",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(221, 52, 52, 52),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (counter > 0) ? counter.toString().padLeft(2, "0") : "👌",
              style: TextStyle(fontSize: 65, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "seconds",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    startTimer();
                    counter = 11;
                  },
                  child: Text("start timer"),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // counter = 10;
                    // if (repeatedFunction!.isActive)
                    repeatedFunction!.cancel();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent)),
                  child: Text("cancel timer"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
