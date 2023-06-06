import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownContainerModel extends StatelessWidget {
  DropdownContainerModel({
    required this.onChanged,
    required this.items,
    required this.hint,
  });

  final List<String> items;
  final ValueChanged onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 60,
          decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
        child: DropdownSearch<String>(
          popupProps: PopupProps<String>.menu(
            showSelectedItems: true,
            showSearchBox: true,
            // disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: items,
          onChanged: onChanged,
          selectedItem: hint,
        dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration:InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)))),
        )
      ),
    );
  }
}
