import 'package:flutter/material.dart';

import '/utilities/styling.dart';
import 'home.dart';

class GreetingsScreen extends StatefulWidget {
  final String bitsIdNumber;

  const GreetingsScreen({Key? key, required this.bitsIdNumber})
      : super(key: key);

  @override
  _GreetingsScreenState createState() => _GreetingsScreenState();
}

class _GreetingsScreenState extends State<GreetingsScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Home(),
    );
  }
}
