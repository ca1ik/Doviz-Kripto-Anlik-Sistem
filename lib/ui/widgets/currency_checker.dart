// widgets/currency_checker.dart
import 'package:flutter/material.dart';

class CurrencyChecker extends StatefulWidget {
  final Map<String, double> rates;

  CurrencyChecker({required this.rates});

  @override
  _CurrencyCheckerState createState() => _CurrencyCheckerState();
}

class _CurrencyCheckerState extends State<CurrencyChecker> {
  String selectedCurrency = 'USD';
  bool isToTL = true;
  TextEditingController inputController = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton<String>(
                dropdownColor: Colors.grey[900],
                value: selectedCurrency,
                items: widget.rates.keys
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e, style: TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                onChanged: (val) => setState(() => selectedCurrency = val!),
              ),
              SizedBox(width: 16),
              Switch(
                value: isToTL,
                onChanged: (val) => setState(() => isToTL = val),
                activeColor: Colors.deepPurpleAccent,
              ),
              Text(
                isToTL ? "$selectedCurrency → TL" : "TL → $selectedCurrency",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Miktar",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              double input = double.tryParse(inputController.text) ?? 0;
              double rate = widget.rates[selectedCurrency] ?? 0;

              setState(() {
                result = isToTL ? input * rate : input / rate;
              });
            },
            child: Text("HESAPLA"),
          ),
          SizedBox(height: 10),
          Text(
            "Sonuç: ${result.toStringAsFixed(2)} ${isToTL ? 'TL' : selectedCurrency}",
            style: TextStyle(color: Colors.greenAccent, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
