import 'package:flutter/material.dart';
import 'package:qz_tf_sn/screen/home_screen.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
