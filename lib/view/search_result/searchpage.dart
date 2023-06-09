import 'package:alive_project_master/view/intro_page/lists.dart';
import 'package:alive_project_master/view/search_result/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textfield_search/textfield_search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchIndividualPageState createState() => _SearchIndividualPageState();
}

class _SearchIndividualPageState extends State<SearchPage> {
  TextEditingController _districtController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _panchayathController = TextEditingController();
  TextEditingController _nameofcrpController = TextEditingController();

  String selectedBlock = '';
  String selectedPanchayath = '';
  String selectedNameOfCrp = '';

  List<DocumentSnapshot> searchResults = [];

  void searchIndividuals() async {
    try {
      String district = _districtController.text;
      String selectedBlock = _blockController.text;

      var query = FirebaseFirestore.instance.collection('data')
          .where('data-district', isEqualTo: district);

      if (selectedBlock.isNotEmpty) {
        query = query.where('data-Block', isEqualTo: selectedBlock);
      }

      if (selectedPanchayath.isNotEmpty) {
        query = query.where('data-Panchayath', isEqualTo: selectedPanchayath);
      }

      if (selectedNameOfCrp.isNotEmpty) {
        query = query.where('data-nameofcrp', isEqualTo: selectedNameOfCrp);
      }

      query = query.limit(200);

      var snapshot = await query.get();

      setState(() {
        searchResults = snapshot.docs;
      });
    } catch (error) {
      print('An error occurred during the search: $error');
      // Handle the error as per your requirement
    }
  }

  List<String> getPanchayathList() {
    List<String> panchayathList = [];
    for (var snapshot in searchResults) {
      var result = snapshot.data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
      String panchayath = result?['data-Panchayath'];
      if (!panchayathList.contains(panchayath)) {
        panchayathList.add(panchayath);
      }
    }
    return panchayathList;
  }

  List<String> getNameOfCrpList() {
    List<String> nameOfCrpList = [];
    for (var snapshot in searchResults) {
      var result = snapshot.data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
      String nameOfCrp = result?['data-nameofcrp'];
      if (!nameOfCrpList.contains(nameOfCrp)) {
        nameOfCrpList.add(nameOfCrp);
      }
    }
    return nameOfCrpList;
  }


  void openIndividualPage(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IndividualPage(itemId: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Individual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search Criteria', style: TextStyle(fontSize: 18)),
            TextFieldSearch(
              controller: _districtController,
              initialList: districts,
              decoration: InputDecoration(labelText: 'District'),
              label: '',
            ),
            TextFieldSearch(
              controller: _blockController,
              initialList: block,
              decoration: InputDecoration(labelText: 'Block'),
              label: '',
            ),
            if (searchResults.isNotEmpty)
              TextFieldSearch(
                controller: _panchayathController,
                initialList: getPanchayathList(),
                decoration: InputDecoration(labelText: 'Panchayath'),
                label: '',
              ),
            if (searchResults.isNotEmpty)
              TextFieldSearch(
                controller: _nameofcrpController,
                initialList: getNameOfCrpList(),
                decoration: InputDecoration(labelText: 'Name of CRP'),
                label: '',
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                searchIndividuals();
                print(searchResults);
              },
              child: Text('Search'),
            ),
            SizedBox(height: 16),
            if(getNameOfCrpList().isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  var result = searchResults[index].data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
                  var documentId = searchResults[index].id;
                  return InkWell(
                    onTap: () {
                      openIndividualPage(documentId);
                    },
                    child: ListTile(
                      title: Text(result?['data-Panchayath'] ?? ''),
                      subtitle: Text(result?['data-nameofcrp'] ?? ''),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
