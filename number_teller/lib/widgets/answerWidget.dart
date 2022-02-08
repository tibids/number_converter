import 'package:flutter/material.dart';
import 'package:number_teller/functions/converter.dart';
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
        SizedBox(
          child: Text(
            input == '' ? 'No number added' : converter(inputString: input),
            style: mainTextStyle.copyWith(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
