import 'package:flutter/material.dart';
import 'package:flutterm8l10/pages/creative_page.dart';
import 'package:flutterm8l10/pages/home_page.dart';
import 'package:flutterm8l10/pages/updatepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
        CreatePage.id: (context) => const CreatePage(),
      },
    );
  }
}