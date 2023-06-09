import 'package:flutter/material.dart';

class ModelProvider extends ChangeNotifier {
  String? _jillamain;
  String? _blockmain;
  String? _panchayathmain;
  String? _zilla;
  String? _ward;
  String? _crp;
  String? _block;
  String? _panchayath;
  String? _kudumbavasta;
  String? _vibhakam;
  String? _prethekavibhakam;
  String? _masavaumanam;
  String? _padavi;
  String? _business;
  String? _cdsregister;
  String? _sambrambamtaram;
  String? _mudakkumudal;
  String? _loan;
  String? _catogery;



  String? get catogery => _catogery;
  String? get crp => _crp;
  String? get dataDistrict => _zilla;
  String? get dataWard => _ward;
  String? get dataBlock => _block;
  String? get dataPanchayath => _panchayath;
  String? get dataClass =>_kudumbavasta;
  String? get dataClass2 => _vibhakam;
  String? get dataClass3 =>_prethekavibhakam;
  String? get dataFamilyincome =>_masavaumanam;
  String? get padavi =>_padavi;
  String? get dataAnimalhusbendaryBusinesstype =>_business;
  String? get dataAnimalhusbendaryCdsregistration =>_cdsregister;
  String? get dataEnterpisetype =>_sambrambamtaram;
  String? get dataAmountinvested =>_mudakkumudal;
  String? get dataLoan =>_loan;
  String? get jillamain =>_jillamain;
  String? get blockmain =>_blockmain;
  String? get panchayathmain =>_panchayathmain;


  void updatecatogery(String? value) {
    _catogery = value;
    notifyListeners();
  }

  void updatepanchayathmain(String? value) {
    _panchayathmain = value;
    notifyListeners();
  }

  void updateblockmain(String? value) {
    _blockmain = value;
    notifyListeners();
  }

  void updatejilla(String? value) {
    _jillamain = value;
    notifyListeners();
  }

  void updatecrp(String? value) {
    _crp = value;
    notifyListeners();
  }

  // void updateZilla(String? value) {
  //   _zilla = value;
  //   notifyListeners();
  // }
  //
  // void updateWard(String? value) {
  //   _ward = value;
  //   notifyListeners();
  // }
  //
  // void updateBlock(String? value) {
  //   _block = value;
  //   notifyListeners();
  // }
  //
  // void updatePanchayath(String? value) {
  //   _panchayath = value;
  //   notifyListeners();
  // }
  //
  // void updatekudumbavasta(String? value) {
  //   _kudumbavasta = value;
  //   notifyListeners();
  // }
  // void updatevibhakam(String? value) {
  //   _vibhakam = value;
  //   notifyListeners();
  // }
  //
  // void updateprethekavibhakam(String? value) {
  //   _prethekavibhakam = value;
  //   notifyListeners();
  // }
  // void updatemasavaumanam(String? value) {
  //   _masavaumanam = value;
  //   notifyListeners();
  // }
  // void updatepadavi(String? value) {
  //   _padavi = value;
  //   notifyListeners();
  // }
  // void updatebusiness(String? value) {
  //   _business = value;
  //   notifyListeners();
  // }
  // void updatecdsregister(String? value) {
  //   _cdsregister = value;
  //   notifyListeners();
  // }
  // void updatesambrambamtaram(String? value) {
  //   _sambrambamtaram = value;
  //   notifyListeners();
  // }
  // void updatemudakkumudal(String? value) {
  //   _mudakkumudal = value;
  //   notifyListeners();
  // }
  // void updateloan(String? value) {
  //   _loan = value;
  //   notifyListeners();
  // }

}