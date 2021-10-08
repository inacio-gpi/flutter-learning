import 'package:flutter/material.dart';
import 'package:flutter_learning/src/modules/currency/currency_controller.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final currencyController =
      CurrencyController(toText: toText, fromText: fromText);
  test('deve converter de real para dollar', () {
    toText.text = '2.0';
    currencyController.convert();
    expect(fromText.text, '0.36');
  });
}
