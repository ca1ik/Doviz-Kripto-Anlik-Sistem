import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final Uri url = Uri.parse("https://www.github.com/ca1ik");
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Text("Developer : @ca1ik"),
        ),
      ),
    );
  }
}
