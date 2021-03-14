import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pulsing_button/pulsing_button.dart';

void main() {
  runApp(PulsingButtonApp());
}

class PulsingButtonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      /// default size is 88x88
                      Expanded(
                        flex: 1,
                        child: PulsingButton(
                          onPressed: () {},
                          fillColor: Colors.blue,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: PulsingButton(
                          onPressed: () {},
                          fillColor: Colors.orange[400],
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image.asset('hearth.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PulsingButton(
                          onPressed: () {},
                          fillColor: Colors.white38,
                          child: Icon(CupertinoIcons.playpause),
                        ),
                      ),
                      Expanded(
                        child: PulsingButton(
                          onPressed: () {},
                          fillColor: Colors.black38,
                          child: Icon(
                            Icons.accessible_outlined,
                            color: Colors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return PulsingButton(
                      onPressed: () {},
                      fillColor: Colors.blue[800],
                      constraints: BoxConstraints.expand(width: constraints.biggest.width, height: constraints.biggest.height) * 0.5,
                      elevation: 40.0,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: Image.asset("like.png"),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
