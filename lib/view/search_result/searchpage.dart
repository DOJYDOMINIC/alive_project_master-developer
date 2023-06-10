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

  @override
  void initState() {
    super.initState();
    _districtController.addListener(searchIndividuals);
  }

  TextEditingController _districtController = TextEditingController();
  TextEditingController _blockController = TextEditingController();
  TextEditingController _panchayathController = TextEditingController();
  TextEditingController _nameofcrpController = TextEditingController();

  String selectedBlock = '';
  String selectedPanchayath = '';
  String selectedNameOfCrp = '';

  List<DocumentSnapshot> searchResults = [];
  List<DocumentSnapshot> filteredResults = [];


  void searchIndividuals() async {
    try {
      String district = _districtController.text;

      var query = FirebaseFirestore.instance.collection('data')
          .where('data-district', isEqualTo: district)
          .limit(200);

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
        filteredResults = searchResults; // Initialize filteredResults with all searchResults
      });
    } catch (error) {
      print('An error occurred during the search: $error');
      // Handle the error as per your requirement
    }
  }

  List<String> getBlockList() {
    List<String> blockList = [];
    for (var snapshot in searchResults) {
      var result = snapshot.data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
      String block = result?['data-Block'];
      if (!blockList.contains(block)) {
        blockList.add(block);
      }
    }
    return blockList;
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

  void applyFilters() {
    filteredResults = searchResults;

    // Apply CRP filter if selectedNameOfCrp is not empty
    if (selectedNameOfCrp.isNotEmpty) {
      filteredResults = filteredResults.where((snapshot) {
        var result = snapshot.data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
        String nameOfCrp = result?['data-nameofcrp'];
        return nameOfCrp.contains(selectedNameOfCrp);
      }).toList();
    }
  }

  void openIndividualPage(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IndividualPage(itemId: id),
      ),
    );
  }

  String selectedCrp = '';

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
              initialList: getBlockList(),
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
            // ElevatedButton(
            //   onPressed: () {
            //     searchIndividuals();
            //     print(searchResults);
            //   },
            //   child: Text('Search'),
            // ),
            if (getNameOfCrpList().isNotEmpty)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedNameOfCrp = _nameofcrpController.text;
                    applyFilters();
                  });
                },
                child: Text('Apply Filters'),
              ),
            if (selectedNameOfCrp.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: filteredResults.length,
                  itemBuilder: (context, index) {
                    var result = filteredResults[index].data() as Map<String, dynamic>?; // Explicit cast to Map<String, dynamic> or nullable
                    var documentId = filteredResults[index].id;
                    return InkWell(
                      onTap: () {
                        openIndividualPage(documentId);
                      },
                      child: ListTile(
                        title: Text(result?['data-Name'] ?? ''),
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
