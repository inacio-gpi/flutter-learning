import 'package:flutter/material.dart';
import 'package:flutter_learning/src/models/currency_model.dart';

class CurrencyRow extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  // final void Function(CurrencyModel model) onChanged;
  final void Function(CurrencyModel?)? onChanged;

  const CurrencyRow({
    Key? key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: selectedItem,
              underline: Container(height: 1, color: Colors.amber),
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      child: Text(e.name),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
