import 'package:flutter/material.dart';
import 'package:number_teller/shared/textStyle.dart';
import 'package:number_teller/widgets/cardWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: const Center(
        child: CardWidget(),
      ),
    );
  }
}
