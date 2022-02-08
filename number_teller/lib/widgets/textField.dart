import 'package:flutter/material.dart';
import 'package:number_teller/shared/textStyle.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  InputTextField({Key? key, required this.callBack}) : super(key: key);
  Function callBack;

  @override
  _InputTextFieldState createState() =>
      _InputTextFieldState(callBack: callBack);
}

class _InputTextFieldState extends State<InputTextField> {
  Function callBack;
  _InputTextFieldState({required this.callBack});
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
            textAlign: TextAlign.center,
            cursorColor: Colors.blueGrey,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey))),
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
                callBack(newInput: number);
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
