import 'package:flutter/material.dart';
import '../../constant/textdecor.dart';

class Headings extends StatelessWidget {
   const Headings({Key? key, required this.text}) : super(key: key);

   final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Center(
        child: Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
            child: Text(text,style:app_text_size_b,)),
      ),
    );
  }
}
