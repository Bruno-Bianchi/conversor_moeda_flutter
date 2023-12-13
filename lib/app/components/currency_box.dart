import 'package:flutter/material.dart';
import '../../models/currency_model.dart';

class CurrencyBox extends StatefulWidget {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel) onChanged;

  CurrencyBox({required this.items, required this.controller, required this.onChanged});

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState(items, controller, onChanged);
}

class _CurrencyBoxState extends State<CurrencyBox> {
  final List<CurrencyModel> items;
  final TextEditingController controller;
  final void Function(CurrencyModel) onChanged;

  _CurrencyBoxState(this.items, this.controller, this.onChanged);

  String moeda = 'Real';

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              value: items.firstWhere((item) => item.name == moeda),
              isExpanded: true,
              underline: Container(height: 1, color: Colors.amber),
              items: items
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList(),
              onChanged: (value) {
                widget.onChanged(value!);
                setState(() {
                  if (value != null) {
                    moeda = value.name;
                  }
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
            ),
          ),
        ),
      ],
    );
  }
}
