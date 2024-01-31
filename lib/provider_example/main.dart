import 'package:flutter/material.dart';
import 'package:flutter_accessiblity/homepage.dart';
import 'package:flutter_accessiblity/provider_example/login_page.dart';
import 'package:flutter_accessiblity/provider_example/provider_class.dart';
import 'package:flutter_accessiblity/text_size.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TapNavigationprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        home: LoginPage(),
      ),
    );
  }
}
