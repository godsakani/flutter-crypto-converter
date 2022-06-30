import 'package:flutter/material.dart';

class Cryptocard extends StatelessWidget {
  const Cryptocard({Key? key, required this.title}) : super(key: key);

  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            title,
          ],
        ),
        color: Colors.blue,
        elevation: 2.0,
      ),
    );
  }
}
