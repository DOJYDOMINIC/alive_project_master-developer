import 'package:flutter/material.dart';

class FamilyUpdate extends StatelessWidget {
  final String itemId;

  const FamilyUpdate({required this.itemId});

  @override
  Widget build(BuildContext context) {
    // Use the itemId in this widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Update'),
      ),
      body: Center(
        child: Text('Item ID: $itemId'),
      ),
    );
  }
}
