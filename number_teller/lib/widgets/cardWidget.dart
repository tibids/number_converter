import 'package:flutter/material.dart';
import 'package:number_teller/shared/borderStyle.dart';
import 'package:number_teller/shared/textStyle.dart';
import 'package:number_teller/widgets/answerWidget.dart';
import 'package:number_teller/widgets/infoDialog.dart';
import 'package:number_teller/widgets/textField.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  String input = '';

  updateInputNum({required String newInput}) {
    setState(() {
      input = newInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white.withOpacity(0.85),
        shape: mainCardBorder,
        elevation: 30,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'NumberConverter',
                        style: mainTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InkWell(
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.blueGrey,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return const InfoDialog();
                                });
                          },
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 30.0,
                    color: Colors.blueGrey,
                    indent: 25.0,
                    endIndent: 25.0,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Please give a number below!',
                      style: mainTextStyle.copyWith(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  InputTextField(
                    callBack: updateInputNum,
                  ),
                  const SizedBox(height: 80.0),
                  AnswerWidget(
                    input: input,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
