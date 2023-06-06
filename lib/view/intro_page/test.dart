import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('dummydata');

  @override
  Widget build(BuildContext context) {
    DocumentReference newDocumentRef = collectionRef.doc();
    String newDocumentId = newDocumentRef.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Page'),
      ),
      body: Column(children: [
        Text(newDocumentId),
        ElevatedButton(
          child: Text('Create Document and Navigate'),
          onPressed: () {
            // createDocumentAndNavigate(context);
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(documentId: newDocumentId),
                    ),
                  );
          },
        ),
      ]),
    );
  }
}

class NextPage extends StatelessWidget {
  final String? documentId;

  NextPage({this.documentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('Document ID: $documentId'),
      ),
    );
  }
}
