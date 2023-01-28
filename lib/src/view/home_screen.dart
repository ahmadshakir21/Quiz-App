import 'package:flutter/material.dart';
import 'package:flutter_application/src/data/question_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color mainColor = const Color(0xFF252c4a);

  Color secondColor = const Color(0xFF117eeb);

  PageController? controller = PageController(initialPage: 0);

  bool isPressed = false;

  Color isTrue = Colors.green;

  Color isWrong = Colors.red;

  Color btnColor = const Color(0xFF117eeb);

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: PageView.builder(
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
                  child: Text(
                    "Question ${index + 1} / ${questions.length}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 25),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 5,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(questions[index].questions!,
                    style: const TextStyle(color: Colors.white, fontSize: 25)),
                const SizedBox(
                  height: 35,
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
                        style: const TextStyle(
                          color: Colors.white,
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
                            ? () {
                                controller!.nextPage(
                                    duration: const Duration(milliseconds: 150),
                                    curve: Curves.linear);
                              }
                            : null,
                        //TODO: change this OutlineButton shape
                        style: OutlinedButton.styleFrom(),
                        child: const Text(
                          "Next Question",
                          style: TextStyle(color: Colors.white),
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
