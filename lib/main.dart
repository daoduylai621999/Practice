import 'package:flutter/material.dart';
import 'package:practice/Repo/db.dart';
import 'Module/member.dart';
import 'Page/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PracticeApp());
}

class PracticeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice",
      theme: new ThemeData(primaryColor: Colors.blueAccent),
      home: new Practice(),
    );
  }


}



