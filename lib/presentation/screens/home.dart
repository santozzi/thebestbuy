import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Best Buy'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              scale: 0.4,
            ),
            const Text(
              'The Best Buy',
              style: TextStyle(fontSize: 54),
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Busqueda',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
