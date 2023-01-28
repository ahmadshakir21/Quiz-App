import 'package:flutter/material.dart';
import 'package:flutter_application/src/constant/constant.dart';
import 'package:flutter_application/src/view/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int time;
  ResultScreen({required this.score, required this.time});
  // Color mainColor = const Color(0xFF252c4a);
  // Color secondColor = const Color(0xFF117eeb);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                score >= 40 ? "Congratulations" : "You Failed! Try again",
                style: TextStyle(
                    color: textColor,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your Score is : ",
                style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                score.toString(),
                style: TextStyle(
                    color: secondColor,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You time amount : ${time}s",
                style: TextStyle(
                    color: secondColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 60,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                },
                color: secondColor,
                textColor: mainColor,
                child: const Text("Repeat the Quiz"),
              )
            ]),
      ),
    ));
  }
}
