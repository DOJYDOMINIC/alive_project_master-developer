import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropdownProvider extends ChangeNotifier {
  String? selectedDistrict;
  String? selectedBlock;
  String? selectedPanchayat;
  String? selectedCRP;
  String? selectedCategory;

  Map<String, List<String>> districtOptions = {
    'District 1': ['Block 1', 'Block 2', 'Block 3'],
    'District 2': ['Block 4', 'Block 5', 'Block 6'],
    'District 3': ['Block 7', 'Block 8', 'Block 9'],
  };

  Map<String, List<String>> blockOptions = {
    'Block 1': ['Panchayat 1', 'Panchayat 2', 'Panchayat 3'],
    'Block 2': ['Panchayat 4', 'Panchayat 5', 'Panchayat 6'],
    'Block 3': ['Panchayat 7', 'Panchayat 8', 'Panchayat 9'],
  };

  Map<String, List<String>> panchayatOptions = {
    'Panchayat 1': ['CRP 1', 'CRP 2', 'CRP 3'],
    'Panchayat 2': ['CRP 4', 'CRP 5', 'CRP 6'],
    'Panchayat 3': ['CRP 7', 'CRP 8', 'CRP 9'],
  };

  Map<String, List<String>> crpOptions = {
    'CRP 1': ['Category 1', 'Category 2', 'Category 3'],
    'CRP 2': ['Category 4', 'Category 5', 'Category 6'],
    'CRP 3': ['Category 7', 'Category 8', 'Category 9'],
  };

  Map<String, List<String>> categoryOptions = {
    'Category 1': [],
    'Category 2': [],
    'Category 3': [],
    'Category 4': [],
    'Category 5': [],
    'Category 6': [],
    'Category 7': [],
    'Category 8': [],
    'Category 9': [],
  };

  DropdownProvider() {
    selectedDistrict = districtOptions.keys.first;
    selectedBlock = districtOptions[selectedDistrict!]!.first;
    selectedPanchayat = blockOptions[selectedBlock!]!.first;
    selectedCRP = panchayatOptions[selectedPanchayat!]!.first;
    selectedCategory = crpOptions[selectedCRP!]!.first;
  }

  void updateSelectedDistrict(String district) {
    selectedDistrict = district;
    selectedBlock = blockOptions[selectedDistrict!]!.first;
    selectedPanchayat = panchayatOptions[selectedBlock!]!.first;
    selectedCRP = crpOptions[selectedPanchayat!]!.first;
    selectedCategory = categoryOptions[selectedCRP!]!.first;
    notifyListeners();
  }

  void updateSelectedBlock(String block) {
    selectedBlock = block;
    selectedPanchayat = panchayatOptions[selectedBlock!]!.first;
    selectedCRP = crpOptions[selectedPanchayat!]!.first;
    selectedCategory = categoryOptions[selectedCRP!]!.first;
    notifyListeners();
  }

  void updateSelectedPanchayat(String panchayat) {
    selectedPanchayat = panchayat;
    selectedCRP = crpOptions[selectedPanchayat!]!.first;
    selectedCategory = categoryOptions[selectedCRP!]!.first;
    notifyListeners();
  }

  void updateSelectedCRP(String crp) {
    selectedCRP = crp;
    selectedCategory = categoryOptions[selectedCRP!]!.first;
    notifyListeners();
  }

  void updateSelectedCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
