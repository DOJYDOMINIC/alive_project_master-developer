import 'package:flutter/material.dart';

class IndividualPage extends StatelessWidget {

  final String itemId;
  final Map<String, dynamic>? details;

  IndividualPage({Key? key, required this.itemId, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${details?['data-Name']}'),
            Text('Address: ${details?['data-Address']}'),
            Text('Contact: ${details?['data-nameofcrp']}'),
            Text('Email: ${details?['data-Phonenumber']}'),
          ],
        ),
      ),
    );
  }
}
