import 'package:flutter/material.dart';
import 'package:qz_tf_sn/model/questions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;
  var score = 0;
  List qList = [
    Questions("1. Flutter is developed by Facebook", false),
    Questions("2. Flutter use platform primitives", false),
    Questions("3. Flutter uses one code base", true),
    Questions(
        "4. Code written on Flutter requires Javascript Interpretter", false),
    Questions(
        "5. A notable feature of the Dart platform is its support for hot reload",
        true),
    Questions("6. Flutter is an app development library", false),
    Questions("7. Is Flutter Free?", true),
    Questions("8. Flutter is only supported on Windows.", false),
    Questions("9. Flutter doesn't support 60fps animations", false),
    Questions("10. Flutter supports cross platform development", true),
  ];

  checkWin(bool userChoice, BuildContext context) {
    if (userChoice == qList[counter].isCorrect) {
      print("Correct");
      score = score + 10;
      final snackbar = SnackBar(
        content: Text("Correct...!!!"),
        duration: Duration(milliseconds: 100),
        backgroundColor: Colors.green.shade400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else
      score = score + 0;
    {
      print("False");
      final snackbar = SnackBar(
        content: Text("Wrong...!!!"),
        duration: Duration(milliseconds: 50),
        backgroundColor: Colors.red.shade400,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      if (counter < 9) {
        counter = counter + 1;
      }
    });
  }

  reset() {
    setState(() {
      counter = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Quiz",
          style: TextStyle(fontSize: 30, color: Color(0xff1F343A)),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Color(0xFFF4F3E3),
      body: Container(
        child: Column(
          children: [
            // Container(
            //   height: 400,
            //   width: 500,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(
            //         "assets/quiz.png",
            //       ),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 30),
            // ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Score $score/100",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: reset,
                      child: Text(
                        "Rest Game",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Container(
              height: 90,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color(0xFF0F78D5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    qList[counter].qText,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => checkWin(true, context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Color(0xFF0F78D5),
                  ),
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => checkWin(false, context),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Color(0xFF0F78D5),
                  ),
                  child: Text(
                    "False",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
