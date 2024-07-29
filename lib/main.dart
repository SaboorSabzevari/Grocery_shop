import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_shop/Model/card_model.dart';
import 'package:provider/provider.dart';
import 'Pages/introScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xffFAFAFA)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>CardModel(),child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    ),);
  }
}