import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/models/currency_model.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 100.0, bottom: 20),
          child: Column(children: [
            Image.asset(
              'assets/images/conversor.webp',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 10),
            CurrencyBox(
              controller: toText,
              items: homeController.currencies, 
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              },
            ),
            SizedBox(height: 20),
            CurrencyBox(
              controller: fromText,
              items: homeController.currencies, 
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                elevation: 10,
              ),
              onPressed: () {
                homeController.convert();
              }, 
              child: Text('CONVERTER')),
          ]),
        ),
      ),
    );
  }
}
