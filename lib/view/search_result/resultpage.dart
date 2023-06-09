import 'package:flutter/material.dart';

class IndividualPage extends StatelessWidget {
  final String itemId;

  const IndividualPage({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Details'),
      ),
      body: Center(
        child: Text('Display individual details for item with ID: $itemId'),
      ),
    );
  }
}
