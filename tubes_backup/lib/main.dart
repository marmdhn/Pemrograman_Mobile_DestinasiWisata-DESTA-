import 'package:flutter/material.dart';
import 'package:tubes_1/screens/welcome/login.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubes',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginScreen(),
    );
  }
}
