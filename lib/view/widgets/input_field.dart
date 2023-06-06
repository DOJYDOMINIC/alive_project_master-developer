import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';


class InputField extends StatelessWidget {
  InputField({Key? key, required this.hint,  required this.controller, this.hintvalue,  required this.onchanged,  this.keytype, }) : super(key: key);
  final String hint;
  final String? hintvalue;
  final TextEditingController controller;
  final ValueChanged onchanged;
  final TextInputType? keytype;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          child: TextFormField(
            onChanged: onchanged,
            keyboardType: keytype,
            controller: controller, decoration: InputDecoration(
              hintText: '${hint} : ${hintvalue ?? ''} ',border: OutlineInputBorder(borderSide: BorderSide.none) ),)
      ),
    );
  }
}
