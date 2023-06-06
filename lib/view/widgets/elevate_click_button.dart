
import 'package:flutter/material.dart';
import '../../constant/elivated_button.dart';


class ElevateClick extends StatelessWidget {
  const ElevateClick({Key? key, required this.ontap, required this.text}) : super(key: key);

  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var height = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
      child: Container(
        height: 50,
        width: width,
        child: ElevatedButton(
            style: buttonstyle_main,
            onPressed:ontap, child: Text(text)),
      ),
    );
  }
}
