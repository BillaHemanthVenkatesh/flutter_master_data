import 'package:flutter/material.dart';
import 'common/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter ';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: HomeWidget(),
    );
  }
  // void _increment()async{
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // int counter=(prefs.getInt('counter')??0)+1;
  // print('pressed.$counter.thanks');
  // await prefs.setInt('counter', counter);
  // }
}