import 'package:number_teller/shared/numbers.dart';

class Converter {
  //The converter takes in a string of numbers than converts it into text
  //It is seperated into different parts : 2 digit numbers, 3 digit numbers , up to 6 digit numbers, up to 9 digit numbers
  //The core of the algorithm is to define the below thousand part for each group
  //eg 265661 is seperated into 2 parts 265 and 661 it uses the same function to convert each part just adds thousands after the first part
  //With this recursive method we can do even bigger numbers than 1 billion with adding just a few lines of code

  late String output;
  String convert({required String inputString}) {
    String cleanedString = int.parse(inputString).toString();
    int numOfDigits = int.parse(inputString).toString().length;

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

      thousandPart = cleanedString.substring(
                  millionDigits, millionDigits + 3) !=
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
    //Converts the below thousand part using the tensFunc and hundredsFunc
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
}
