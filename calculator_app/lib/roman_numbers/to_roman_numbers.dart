import 'package:calculator_app/roman_numbers/to_decimal_numbers.dart';
import 'package:invertible/invertible.dart';
import 'symbol_utils.dart';

/// Provides ability to represent Decimal integers as Roman numerals
class ToRomanNumbers extends InvertibleFunction<int, String> {
  /// Constructs a ToRoman object with the given charset - [_symbols]
  ToRomanNumbers([this._symbols = standardSymbols])
      : _biggestRepresentableNumber =
  biggestRepresentableNumber(_symbols.length) {
    if (!areValidSymbols(_symbols)) {
      throw ArgumentError.value(_symbols, 'symbols',
          'Invalid charset, symbols must be non-empty and distinct, e.g. I, V, X, L, C, D, M');
    }
  }

  /// Constructs a ToRoman object with the standard charset - I, V, X, L, C, D, M
  ToRomanNumbers.standard() : this(standardSymbols);

  final List<String> _symbols;

  final int _biggestRepresentableNumber;

  @override
  List<bool Function(int)> get domain => <bool Function(int)>[
        (int x) => 0 <= x && x <= _biggestRepresentableNumber
  ];

  @override
  String valueAt(int x) {
    if (x == 0) return '';

    final List<String> result = <String>[];

    int n = x;

    for (int i = _symbols.length - 1; i >= 0; i -= 1) {
      final int value = valueOfSymbolAt(i);

      final int count = n ~/ value;

      if (count < 4) {
        for (int j = 0; j < count; j += 1) {
          result.add(_symbols[i]);
        }
      } else if (count == 4) {
        if (result.isEmpty || result.last != _symbols[i + 1]) {
          result.add(_symbols[i]);
          result.add(_symbols[i + 1]);
        } else {
          result.removeLast();
          result.add(_symbols[i]);
          result.add(_symbols[i + 2]);
        }
      } else {
        // count > 4 is not possible
      }

      n -= value * count;
    }

    return result.join('');
  }

  @override
  ToDecimalNumbers inverse() => ToDecimalNumbers(_symbols);
}