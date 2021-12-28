import 'package:flutter/material.dart';

class ItemStudent extends StatelessWidget {
  final List dataStudent;
  ItemStudent({this.dataStudent});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.blueAccent,
        style: BorderStyle.solid,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(dataStudent[1]),
          ),
          Container(
            child: Text(dataStudent[2]),
          ),
          Container(
            child: Text(dataStudent[3]),
          )
        ],
      ),
    );
  }
}
