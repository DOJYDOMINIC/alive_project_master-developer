import 'package:flutter/cupertino.dart';

class DropdownProvider extends ChangeNotifier {
  String selectedDistrict = 'District 1';
  String selectedBlock = 'Block 1';
  String selectedPanchayat = 'Panchayat 1';
  String selectedCRP = 'CRP 1';
  String selectedCategory = 'Category 1';

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

  get categoryOptions => null;

  void updateSelectedDistrict(String district) {
    selectedDistrict = district;
    selectedBlock = districtOptions[selectedDistrict]![0];
    notifyListeners();
  }

  void updateSelectedBlock(String block) {
    selectedBlock = block;
    selectedPanchayat = blockOptions[selectedBlock]![0];
    notifyListeners();
  }

  void updateSelectedPanchayat(String panchayat) {
    selectedPanchayat = panchayat;
    selectedCRP = panchayatOptions[selectedPanchayat]![0];
    notifyListeners();
  }

  void updateSelectedCRP(String crp) {
    selectedCRP = crp;
    selectedCategory = crpOptions[selectedCRP]![0];
    notifyListeners();
  }

  void updateSelectedCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}
