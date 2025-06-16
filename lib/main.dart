import 'package:flutter/material.dart';
import 'package:style__check/screens/add_invoice.dart';
import 'package:style__check/screens/sample_screen.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SampleScreen(),
    );
  }
}