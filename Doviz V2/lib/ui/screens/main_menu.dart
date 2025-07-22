import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'graph_widget.dart';
import 'currency_checker.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Menü'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthService.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Kur Grafiği"),
            trailing: Icon(Icons.trending_up),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: GraphWidget(),
          ),
          Divider(),
          ListTile(
            title: Text("Kur Sorgula"),
            trailing: Icon(Icons.monetization_on),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CurrencyChecker(),
          ),
        ],
      ),
    );
  }
}
