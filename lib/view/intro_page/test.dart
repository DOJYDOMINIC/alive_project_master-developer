import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final List<Map<String, dynamic>> individuals;

  const SearchResultsPage({Key? key, required this.individuals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: individuals.length,
        itemBuilder: (context, index) {
          final individual = individuals[index];
          final name = individual['data-Name'] as String;
          final phoneNumber = individual['data-Phonenumber'] as String;

          return ListTile(
            title: Text(name),
            subtitle: Text(phoneNumber),
          );
        },
      ),
    );
  }
}
