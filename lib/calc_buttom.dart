import 'package:flutter/material.dart';

class CalcButtom extends StatelessWidget {
  CalcButtom({super.key, required this.text,required this.onButtonClick});
  String text;
  Function onButtonClick ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onButtonClick(text);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            )));
  }
}
