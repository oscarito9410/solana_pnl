import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:solana_pnl/contants.dart';
import 'package:solana_pnl/pages/home.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), useMaterial3: true, fontFamily: pixelifyFont),
        darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark, fontFamily: pixelifyFont),
        themeMode: ThemeMode.dark,
        home: const HomePage());
  }
}

