import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  const Sidebar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final items = ['Login', 'Main Menu', 'Settings', 'Help'];
    return Container(
      width: 200,
      color: Colors.black87,
      child: ListView(
        children: items.map((item) {
          return ListTile(
            title: Text(item, style: TextStyle(color: Colors.white)),
            onTap: () => onItemSelected(item),
            hoverColor: Colors.deepPurple,
          );
        }).toList(),
      ),
    );
  }
}
