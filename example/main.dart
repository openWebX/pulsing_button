import 'package:flutter/material.dart';
import 'package:pulsing_button/pulsing_button.dart';

void main() {
  runApp(ExamplePulsingButton());
}

class ExamplePulsingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: PulsingButton(
              onPressed: () {},
              child: Icon(Icons.favorite),
              padding: EdgeInsets.all(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
