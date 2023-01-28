import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/src/constant/constant.dart';
import 'package:flutter_application/src/data/question_list.dart';
import 'package:flutter_application/src/view/result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? controller = PageController(initialPage: 0);
  bool isPressed = false;
  int time = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) => setState(() {
              time++;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller!,
          onPageChanged: (value) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Question ${index + 1} / ${questions.length}",
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 25),
                      ),
                      Text(
                        "${time}s",
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: textColor,
                  height: 5,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(questions[index].questions!,
                    style: TextStyle(color: textColor, fontSize: 25)),
                const SizedBox(
                  height: 50,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 18),
                    child: MaterialButton(
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score = score + 10;
                                print(score);
                              }
                            },
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? isTrue
                              : isWrong
                          : secondColor,
                      child: Text(
                        questions[index].answers!.keys.toList()[i],
                        style: TextStyle(
                          color: mainColor,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                          score: score, time: time),
                                    ));
                                  }
                                : () {
                                    controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 150),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: BorderSide(color: secondColor, width: 2),
                        ),
                        child: Text(
                          index + 1 == questions.length
                              ? "See Result"
                              : "Next Question",
                          style: TextStyle(color: textColor),
                        )),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
