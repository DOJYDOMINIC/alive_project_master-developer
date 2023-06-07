import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late List<String> districtList = [];
  late List<String> blockList = [];
  late List<String> panchayathList = [];
  late List<String> crpList = [];
  String? selectedDistrict;
  String? selectedBlock;
  String? selectedPanchayath;
  String? selectedCrp;

  @override
  void initState() {
    super.initState();
    fetchDistricts();
  }

  Future<void> fetchDistricts() async {
    final districtSnapshot = await FirebaseFirestore.instance.collection('data').get();
    setState(() {
      districtList = districtSnapshot.docs.map((doc) => doc['data-district'] as String).toList();
      selectedDistrict = districtList.isNotEmpty ? districtList.first : null;
    });
  }

  Future<void> fetchBlocks(String district) async {
    final blockSnapshot = await FirebaseFirestore.instance
        .collection('data')
        .where('data-district', isEqualTo: district)
        .get();
    setState(() {
      blockList = blockSnapshot.docs.map((doc) => doc['data-Block'] as String).toList();
      selectedBlock = blockList.isNotEmpty ? blockList.first : null;
    });
  }

  Future<void> fetchPanchayaths(String district, String block) async {
    final panchayathSnapshot = await FirebaseFirestore.instance
        .collection('data')
        .where('data-district', isEqualTo: district)
        .where('data-Block', isEqualTo: block)
        .get();
    setState(() {
      panchayathList = panchayathSnapshot.docs.map((doc) => doc['data-Panchayath'] as String).toList();
      selectedPanchayath = panchayathList.isNotEmpty ? panchayathList.first : null;
    });
  }

  Future<void> fetchCrpNames(String district, String block, String panchayath) async {
    final crpSnapshot = await FirebaseFirestore.instance
        .collection('data')
        .where('data-district', isEqualTo: district)
        .where('data-Block', isEqualTo: block)
        .where('data-Panchayath', isEqualTo: panchayath)
        .get();
    setState(() {
      crpList = crpSnapshot.docs.map((doc) => doc['data-nameofcrp'] as String).toList();
      selectedCrp = crpList.isNotEmpty ? crpList.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('District'),
            DropdownButton<String>(
              value: selectedDistrict,
              items: districtList.map((district) {
                return DropdownMenuItem<String>(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                  selectedBlock = null;
                  selectedPanchayath = null;
                  selectedCrp = null;
                });
                fetchBlocks(value!);
              },
            ),
            SizedBox(height: 16.0),
            Text('Block'),
            DropdownButton<String>(
              value: selectedBlock,
              items: blockList.map((block) {
                return DropdownMenuItem<String>(
                  value: block,
                  child: Text(block),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBlock = value;
                  selectedPanchayath = null;
                  selectedCrp = null;
                });
                fetchPanchayaths(selectedDistrict!, value!);
              },
            ),
            SizedBox(height: 16.0),
            Text('Panchayath'),
            DropdownButton<String>(
              value: selectedPanchayath,
              items: panchayathList.map((panchayath) {
                return DropdownMenuItem<String>(
                  value: panchayath,
                  child: Text(panchayath),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPanchayath = value;
                  selectedCrp = null;
                });
                fetchCrpNames(selectedDistrict!, selectedBlock!, value!);
              },
            ),
            SizedBox(height: 16.0),
            Text('CRP Name'),
            DropdownButton<String>(
              value: selectedCrp,
              items: crpList.map((crpName) {
                return DropdownMenuItem<String>(
                  value: crpName,
                  child: Text(crpName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCrp = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
