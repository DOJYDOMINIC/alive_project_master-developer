import 'package:flutter/material.dart';

class MultiLevelDropDownExample extends StatefulWidget {
  const MultiLevelDropDownExample({Key? key}) : super(key: key);

  @override
  State<MultiLevelDropDownExample> createState() =>
      _MultiLevelDropDownExampleState();
}

class _MultiLevelDropDownExampleState extends State<MultiLevelDropDownExample> {
  final List<String> districts = [
    'District 1',
    'District 2',
  ];
  final Map<String, List<String>> blocks = {
    'District 1': ['Block A', 'Block B'],
    'District 2': ['Block C', 'Block D'],
  };
  final Map<String, List<String>> panchayaths = {
    'Block A': ['Panchayath 1', 'Panchayath 2'],
    'Block B': ['Panchayath 3', 'Panchayath 4'],
    'Block C': ['Panchayath 5', 'Panchayath 6'],
    'Block D': ['Panchayath 7', 'Panchayath 8'],
  };

  String? selectedDistrict;
  String? selectedBlock;
  String? selectedPanchayath;

  onDistrictChanged(String? value) {
    // Reset the selected values for block and panchayath
    setState(() {
      selectedDistrict = value;
      selectedBlock = null;
      selectedPanchayath = null;
    });
  }

  onBlockChanged(String? value) {
    // Reset the selected value for panchayath
    setState(() {
      selectedBlock = value;
      selectedPanchayath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton<String?>(
              value: selectedDistrict,
              items: districts.map((district) {
                return DropdownMenuItem<String?>(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
              onChanged: onDistrictChanged,
              hint: Text('Select District'),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String?>(
              value: selectedBlock,
              items: (blocks[selectedDistrict] ?? []).map((block) {
                return DropdownMenuItem<String?>(
                  value: block,
                  child: Text(block),
                );
              }).toList(),
              onChanged: onBlockChanged,
              hint: Text('Select Block'),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton<String?>(
              value: selectedPanchayath,
              items: (panchayaths[selectedBlock] ?? []).map((panchayath) {
                return DropdownMenuItem<String?>(
                  value: panchayath,
                  child: Text(panchayath),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedPanchayath = val!;
                });
              },
              hint: Text('Select Panchayath'),
            ),
          ],
        ),
      ),
    );
  }
}
