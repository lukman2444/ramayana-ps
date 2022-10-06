import 'package:flutter/material.dart';

class Animasi extends StatefulWidget {
  const Animasi({super.key});

  @override
  State<Animasi> createState() => _AnimasiState();
}

class _AnimasiState extends State<Animasi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: 500,
            height: 700,
            color: Colors.green,
          ),
          Container(
            width: 300,
            height: 700,
            color: Colors.red,
          ),
          Container(
              width: 200,
              height: 600,
              color: Colors.black,
              child: ListView(
                children: [
                  Chip(
                    label: Text('Hello World'),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
