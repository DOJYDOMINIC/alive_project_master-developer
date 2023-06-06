import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class SearchFieldModel extends StatelessWidget {
  SearchFieldModel({
    Key? key,
    required this.hint,
    required this.controller,
    this.hintvalue,
    required this.onchanged,
    required this.list,
  }) : super(key: key);
  final String hint;
  final String? hintvalue;
  final TextEditingController controller;
  final VoidCallback onchanged;
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
          height: 70,
          width: 375,
          child: TextFieldSearch(
              label: hint,
              controller: controller,
              initialList: list,
              getSelectedValue:onchanged,
              decoration: InputDecoration(
                  hintText: '${hint} : ${hintvalue ?? ''} ',
                  border: OutlineInputBorder(borderSide: BorderSide.none)))),
    );
  }
}
