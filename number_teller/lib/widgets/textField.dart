import 'package:flutter/material.dart';
import 'package:number_teller/shared/textStyle.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({Key? key}) : super(key: key);

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  String number = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: mainTextStyle.copyWith(fontSize: 25.0),
            onChanged: (inputString) {
              setState(() {
                number = inputString;
              });
            },
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      Colors.blueGrey.withOpacity(0.05))),
              onPressed: () {
                //number converter function here
              },
              child: const Text(
                'Convert',
                style: mainTextStyle,
              ))
        ],
      ),
    );
  }
}
