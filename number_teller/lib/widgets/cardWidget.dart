import 'package:flutter/material.dart';
import 'package:number_teller/shared/borderStyle.dart';
import 'package:number_teller/shared/textStyle.dart';
import 'package:number_teller/widgets/infoDialog.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: mainCardBorder,
      elevation: 30,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.90,
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
                  'Number Converter',
                  style: mainTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: InkWell(
                    child: const Icon(Icons.info_outline),
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
              color: Colors.black,
              indent: 25.0,
              endIndent: 25.0,
            )
          ],
        ),
      ),
    );
  }
}
