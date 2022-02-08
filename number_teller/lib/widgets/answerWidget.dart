import 'package:flutter/material.dart';
import 'package:number_teller/shared/textStyle.dart';

class AnswerWidget extends StatefulWidget {
  const AnswerWidget({Key? key}) : super(key: key);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const <Widget>[
          Text(
            'Your number is:',
            style: mainTextStyle,
          ),
        ],
      ),
    );
  }
}
