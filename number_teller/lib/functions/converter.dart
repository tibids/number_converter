import 'package:number_teller/functions/belowThousand.dart';
import 'package:number_teller/shared/numbers.dart';

String converter({required String inputString}) {
  String cleanedString = int.parse(inputString).toString();
  int numOfDigits = int.parse(inputString).toString().length;
  String output;

  if (numOfDigits < 3 && numOfDigits > 0) {
    //For numbers under 100

    output = tensFunc(cleanedString: cleanedString);
  } else if (numOfDigits == 3) {
    //For numbers from 100 to 999

    output = belowThousand(addAnd: true, cleanedString: cleanedString);
  } else if (numOfDigits > 3 && numOfDigits < 7) {
    //For numbers from 1000 to 999999

    int thousandDigits = numOfDigits - 3;
    String thousandPart;
    String belowThousandPart = belowThousand(
        addAnd: true, cleanedString: cleanedString.substring(thousandDigits));
    print(cleanedString.substring(0, thousandDigits));

    thousandPart =
        '${belowThousand(addAnd: true, cleanedString: cleanedString.substring(0, thousandDigits))} thousand';

    output = '$thousandPart $belowThousandPart';
  } else if (numOfDigits > 6 && numOfDigits < 10) {
    //For numbers from 10000 to 999999999

    int millionDigits = numOfDigits - 6;
    String millionPart;
    String thousandPart;
    String belowThousandPart = belowThousand(
        addAnd: true,
        cleanedString: cleanedString.substring(millionDigits + 3));

    thousandPart = cleanedString.substring(millionDigits, millionDigits + 3) !=
            '000'
        ? '${belowThousand(addAnd: true, cleanedString: cleanedString.substring(millionDigits, millionDigits + 3))} thousand'
        : '';

    if (millionDigits == 3) {
      millionPart =
          '${belowThousand(addAnd: false, cleanedString: cleanedString.substring(0, 3))} million';
    } else {
      millionPart =
          '${belowThousand(addAnd: false, cleanedString: cleanedString.substring(0, millionDigits))} million';
    }

    output = '$millionPart $thousandPart $belowThousandPart';
  } else {
    output = 'Please use a number below 1 billion';
  }

  return output;
}
