import 'package:flutter_test/flutter_test.dart';
import 'package:number_teller/functions/converter.dart';

void main() {
  group('converter test', () {
    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '0');
      expect(converter.output, 'zero');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '7');
      expect(converter.output, 'seven');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '42');
      expect(converter.output, 'forty-two');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '1999');
      expect(converter.output, 'one thousand nine hundred and ninety-nine');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '2001');
      expect(converter.output, 'two thousand and one');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '17999');
      expect(
          converter.output, 'seventeen thousand nine hundred and ninety-nine');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '342251');
      expect(converter.output,
          'three hundred and forty-two thousand two hundred and fifty-one');
    });

    test('The converter should convert the given digits to numbers', () {
      final converter = Converter();
      converter.convert(inputString: '1300420');
      expect(converter.output,
          'one million three hundred thousand four hundred and twenty');
    });
  });
}
