import 'package:flutter/material.dart';

import '../../models/currency_model.dart';

class HomeController {

  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;
  
  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1]; 
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double totalValue = 0;

    if(fromCurrency!.name == 'Real'){
      totalValue = value * toCurrency!.real;
    }else if(fromCurrency!.name == 'Dolar') {
      totalValue = value * toCurrency!.dolar;
    }else if(fromCurrency!.name == 'Euro'){
      totalValue = value * toCurrency!.euro;
    }else if(fromCurrency!.name == 'Bitcoin'){
      totalValue = value * toCurrency!.bitcoin;
    }

    fromText.text = totalValue.toStringAsFixed(2);
  }
}