import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_1/authentication/authentication.dart';
import 'package:tubes_1/screens/login/login.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Authentication())],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tubes',
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: LoginScreen(),
      ),
    );
  }
}
