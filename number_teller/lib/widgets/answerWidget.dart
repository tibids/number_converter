import 'package:flutter/material.dart';
import 'package:number_teller/shared/textStyle.dart';

class AnswerWidget extends StatelessWidget {
  AnswerWidget({Key? key, required this.input}) : super(key: key);
  String input;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Your number is:',
          style: mainTextStyle,
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          input,
          style: mainTextStyle,
        ),
      ],
    );
  }
}
