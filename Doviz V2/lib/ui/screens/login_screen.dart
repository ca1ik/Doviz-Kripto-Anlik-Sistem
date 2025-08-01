import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(), // Soldan menü (birazdan tanımlayacağız)
          Expanded(
            child: Center(
              child: Container(
                width: 400,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: idController,
                      decoration: InputDecoration(labelText: "User ID"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (idController.text.length < 5 ||
                            passwordController.text.length < 8) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('ID en az 5, şifre en az 8 karakter olmalı.'),
                          ));
                          return;
                        }

                        // TODO: veritabanı kontrolü
                        Navigator.pushReplacementNamed(context, '/main');
                      },
                      child: Text("Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text("Register"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
