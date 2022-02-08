import 'package:number_teller/shared/numbers.dart';

String hundredsFunc({required String cleanedString}) {
  //converts the numbers at the hundreds

  return cleanedString != '0' ? '${belowTwenty[cleanedString]} hundred' : '';
}

String tensFunc({required String cleanedString}) {
  //converts the numbers at the tens

  int cleanedNumber = int.parse(cleanedString);
  String output;

  if (cleanedString == '00') {
    output = '';
  } else if (cleanedNumber < 21) {
    //Clean string again to get rid of the 01,02.. numbers

    cleanedString = int.parse(cleanedString).toString();

    output = belowTwenty[cleanedString]!;
  } else {
    output = '${tens[cleanedString[0]]}-${belowTwenty[cleanedString[1]]}';
  }

  return output;
}

String belowThousand({required bool addAnd, required String cleanedString}) {
  String output;

  if (cleanedString.substring(1) == '00') {
    output = hundredsFunc(cleanedString: cleanedString[0]);
  } else if (addAnd) {
    output = cleanedString.length == 3
        ? '${hundredsFunc(cleanedString: cleanedString[0])} and ${tensFunc(cleanedString: cleanedString.substring(1))}'
        : tensFunc(cleanedString: cleanedString);
  } else {
    output = cleanedString.length == 3
        ? '${hundredsFunc(cleanedString: cleanedString[0])} ${tensFunc(cleanedString: cleanedString.substring(1))}'
        : tensFunc(cleanedString: cleanedString);
  }

  return output;
}
