import 'package:flutter/material.dart';
import 'package:flutter_learning/src/shared/widgets/currency_row/currency_row.dart';

import 'currency_controller.dart';

class CurrencyPage extends StatefulWidget {
  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late CurrencyController currencyController;
  @override
  void initState() {
    super.initState();
    currencyController = CurrencyController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              CurrencyRow(
                selectedItem: currencyController.toCurrency,
                controller: toText,
                items: currencyController.currencies,
                onChanged: (model) {
                  setState(() {
                    currencyController.toCurrency = model!;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyRow(
                selectedItem: currencyController.fromCurrency,
                controller: fromText,
                items: currencyController.currencies,
                onChanged: (model) {
                  setState(() {
                    currencyController.fromCurrency = model!;
                  });
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                ),
                onPressed: () {
                  currencyController.convert();
                },
                child: Text(
                  'CONVERTER',
                ),
              ),
            ],
            // SizedBox(height: 30),
          ),
        ),
      ),
    );
  }
}
