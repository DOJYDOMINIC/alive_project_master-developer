import 'package:alive_project_master/constant/textdecor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatefulWidget {
  final String itemId;
  final Map<String, dynamic>? details;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  IndividualPage({Key? key, required this.itemId, this.details}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late TextEditingController dataName;
  late TextEditingController dataAddress;
  late TextEditingController datanameofcrp;
  late TextEditingController dataPhonenumber;

  @override
  void initState() {
    super.initState();
    dataName = TextEditingController(text: widget.details?['data-Name']);
    dataAddress = TextEditingController(text: widget.details?['data-Address']);
    datanameofcrp = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataPhonenumber = TextEditingController(text: widget.details?['data-Phonenumber']);
  }

  Future<void> updateDetails() async {
    try {
      final updatedDetails = {
        'data-Name': dataName.text,
        'data-Address': dataAddress.text,
        'data-nameofcrp': datanameofcrp.text,
        'data-Phonenumber': dataPhonenumber.text,
      };

      await widget._firestore.collection('data').doc(widget.itemId).update(updatedDetails);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Details updated successfully')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update details')));
    }
  }


  @override
  void dispose() {
    dataName.dispose();
    dataAddress.dispose();
    datanameofcrp.dispose();
    dataPhonenumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_thea_color,
        title: Text('Individual Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: dataName,
              decoration: InputDecoration(labelText: 'name'),
            ),
            TextField(
              controller: dataAddress,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: datanameofcrp,
              decoration: InputDecoration(labelText: 'crp'),
            ),
            TextField(
              controller: dataPhonenumber,
              decoration: InputDecoration(labelText: 'phone'
              ),
            ),
            TextField(

            ),
            ElevatedButton(
              onPressed: updateDetails,
              child: Text('Update Details'),
            ),
          ],
        ),
      ),
    );
  }
}
