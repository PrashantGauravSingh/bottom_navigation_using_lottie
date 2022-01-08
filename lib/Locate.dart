import 'package:flutter/material.dart';

class Locate extends StatefulWidget {
  @override
  _LocateState createState() => _LocateState();
}

class _LocateState extends State<Locate> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: ListView.builder(
        itemCount: 40,
        itemBuilder: (context, position) {
          return Card(
            elevation: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(position.toString(), style: TextStyle(fontSize: 22.0),),
            ),
          );
        },
      ),);
  }
}
