import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gasolina_alcool/widgets/input.widget.dart';
import 'package:gasolina_alcool/widgets/loading-button.widget.dart';
import 'package:gasolina_alcool/widgets/logo.widget.dart';
import 'package:gasolina_alcool/widgets/success.widget.dart';

import 'Home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}
