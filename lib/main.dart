import 'package:flutter/material.dart';
import 'package:flutter_accessiblity/homepage.dart';
import 'package:flutter_accessiblity/login_page.dart';
import 'package:flutter_accessiblity/text_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Homepage(),
    );
  }
}
