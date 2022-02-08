import 'package:flutter/material.dart';
import 'package:number_teller/shared/borderStyle.dart';
import 'package:number_teller/shared/textStyle.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: mainCardBorder,
      backgroundColor: Colors.white.withOpacity(0.8),
      content: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Text(
          'This app converts your numbers given by digits into words. Please use numbers below 1 billion.',
          textAlign: TextAlign.center,
          style: mainTextStyle.copyWith(fontSize: 16.0),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(context);
            },
            child: const Text(
              'Got it!',
              style: mainTextStyle,
            ),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent)),
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
