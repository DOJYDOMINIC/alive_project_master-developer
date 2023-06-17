import 'package:flutter/cupertino.dart';

enum CheckboxOption {
  applied,
  sanctioned,
  notApplied,
}

class TextMain extends ChangeNotifier {

  bool _isYesSelected = false;

  bool get isYesSelected => _isYesSelected;

  void updateIsYesSelected(bool value) {
    _isYesSelected = value;
    notifyListeners();
  }

  CheckboxOption _selectedOption = CheckboxOption.notApplied;
  CheckboxOption get selectedOption => _selectedOption;

  void updateSelectedOption(CheckboxOption option) {
    _selectedOption = option;
    notifyListeners();
  }

  // void updateTextFieldValue1(String? value) {
  //   _dataTotalinvestment = value;
  //   notifyListeners();
  // }
  //
  // void updateTextFieldValue2(String? value) {
  //   _dataDateofLoanApplication = value;
  //   notifyListeners();
  // }

  String? _dataDistrict;
  String? _dataBlock;
  String? _dataPanchayath;
  String? _dataWard;
  String? _dataName;
  String? _dataAddress;
  String? _dataPhonenumber;
  String? _dataClass;
  String? _dataClass2;
  List? _dataClass3;
  String? _dataFamilyincome;
  String? _dataNameofNg;
  String? _dataNameofNGmember;
  String? _dataRoleinNg;
  String? _dataHouseownership;
  String? _dataLanddetailsLandarea;
  String? _dataLanddetailsAgricultureland;
  List? _dataAnimalhusbendaryBusinesstype;
  String? _dataAnimalhusbendaryOthers0;
  String? _dataAnimalhusbendaryCdsregistration;
  String? _dataAnimalhusbendaryRegdetailsRegnumber;
  String? _dataAnimalhusbendaryRegdetailsCdsunitname;
  String? _dataEnterpisetype;
  String? _dataNoofgroupmembers;
  String? _dataYearofstartingagriculture;
  String? _dataYearofstartingbussiness;
  String? _dataAmountinvested;
  String? _dataSourceofinvestment;
  String? _dataSupportrecived;
  String? _dataLoan;
  String? _dataTotalinvestment;
  String? _dataDateofLoanApplication;
  String? _dataBusinessidea;
  String? _dataInfraInfrastructure;
  String? _dataInfraShed;
  String? _dataInfraWastage;
  String? _dataInfraBiogas;
  String? _dataInfraEquipments;
  String? _dataInfraOthers;
  String? _dataSupport;
  String? _dataOthers2;
  String? _dataMgnregAsupport;
  String? _dataLanddetails1Landforgrass;
  String? _dataLanddetails1Qtyofownland;
  String? _dataLanddetails1Qtyofleasedland;
  String? _dataLanddetails2Siteforworkshed;
  String? _dataLanddetails2Qtyofownland;
  String? _dataOthers4;
  String? _dataTrainingsrequired;
  String? _dataOthers3;
  String? _dataComments;
  String? _dataNameofcrp;
  String? _dataNameofrespondent;
  String? _dataDateofsurvey;
  String? _dataStarttime;
  String? _dataMetaInstanceId;
  String? _key;

  //-----------------fsmily--------------
  String? _dataFamilydetailsNameoffailyfmember;
  String? _dataFamilydetailsRelation;
  String? _dataFamilydetailsAgeoffamilymember;
  String? _dataFamilydetailsEducation;
  String? _dataFamilydetailsJob;
  String? _dataFamilydetailsSkill;
  String? _parentKey;

  //------------------product--------------
  String? _dataProductsPrdct;
  String? _dataProductsQuantum;
  String? _dataProductsPrice2;

  //-----------------Purchase-----------------
  String? _dataPurchaseofrawmaterialsItemtype;
  String? _dataPurchaseofrawmaterialsQuantity;
  String? _dataPurchaseofrawmaterialsPrice;
  String? _dataPurchaseofrawmaterialsBrand;
  String? _dataPurchaseofrawmaterialsOwn;
  String? _dataPurchaseofrawmaterialsRetail;
  String? _dataPurchaseofrawmaterialsP2;
  String? _dataPurchaseofrawmaterialsWholesale;
  String? _dataPurchaseofrawmaterialsP3;
  String? _dataPurchaseofrawmaterialsGroup;
  String? _dataPurchaseofrawmaterialsP4;
  String? _dataPurchaseofrawmaterialsSubsidy;
  String? _dataPurchaseofrawmaterialsP5;
  // -----------------sales----------
  String? _dataSalesprdct2;
  String? _dataSalesquntum2;
  String? _dataSalessalesmethod;
  //------------livelyhood------------
  String? _datalivelihoodincomesource;
  String? _datalivelihoodnumbers;
  String? _datalivelihoodcapitalsource;
  String? _datalivelihoodrevenue;
  // --------------------------------------

  String? get dataDistrict => _dataDistrict;

  String? get dataBlock => _dataBlock;

  String? get dataPanchayath => _dataPanchayath;

  String? get dataWard => _dataWard;

  String? get dataName => _dataName;

  String? get dataAddress => _dataAddress;

  String? get dataPhonenumber => _dataPhonenumber;

  String? get dataClass => _dataClass;

  String? get dataClass2 => _dataClass2;

  List? get dataClass3 => _dataClass3;

  String? get dataFamilyincome => _dataFamilyincome;

  String? get dataNameofNg => _dataNameofNg;

  String? get dataNameofNGmember => _dataNameofNGmember;

  String? get dataRoleinNg => _dataRoleinNg;

  String? get dataHouseownership => _dataHouseownership;

  String? get dataLanddetailsLandarea => _dataLanddetailsLandarea;

  String? get dataLanddetailsAgricultureland => _dataLanddetailsAgricultureland;

  List? get dataAnimalhusbendaryBusinesstype =>
      _dataAnimalhusbendaryBusinesstype;

  String? get dataAnimalhusbendaryOthers0 => _dataAnimalhusbendaryOthers0;

  String? get dataAnimalhusbendaryCdsregistration =>
      _dataAnimalhusbendaryCdsregistration;

  String? get dataAnimalhusbendaryRegdetailsRegnumber =>
      _dataAnimalhusbendaryRegdetailsRegnumber;

  String? get dataAnimalhusbendaryRegdetailsCdsunitname =>
      _dataAnimalhusbendaryRegdetailsCdsunitname;

  String? get dataEnterpisetype => _dataEnterpisetype;

  String? get dataNoofgroupmembers => _dataNoofgroupmembers;

  String? get dataYearofstartingagriculture => _dataYearofstartingagriculture;

  String? get dataYearofstartingbussiness => _dataYearofstartingbussiness;

  String? get dataAmountinvested => _dataAmountinvested;

  String? get dataSourceofinvestment => _dataSourceofinvestment;

  String? get dataSupportrecived => _dataSupportrecived;

  String? get dataLoan => _dataLoan;

  String? get dataTotalinvestment => _dataTotalinvestment;

  String? get dataDateofLoanApplication => _dataDateofLoanApplication;

  String? get dataBusinessidea => _dataBusinessidea;

  String? get dataInfraInfrastructure => _dataInfraInfrastructure;

  String? get dataInfraShed => _dataInfraShed;

  String? get dataInfraWastage => _dataInfraWastage;

  String? get dataInfraBiogas => _dataInfraBiogas;

  String? get dataInfraEquipments => _dataInfraEquipments;

  String? get dataInfraOthers => _dataInfraOthers;

  String? get dataSupport => _dataSupport;

  String? get dataOthers2 => _dataOthers2;

  String? get dataMgnregAsupport => _dataMgnregAsupport;

  String? get dataLanddetails1Landforgrass => _dataLanddetails1Landforgrass;

  String? get dataLanddetails1Qtyofownland => _dataLanddetails1Qtyofownland;

  String? get dataLanddetails1Qtyofleasedland =>
      _dataLanddetails1Qtyofleasedland;

  String? get dataLanddetails2Siteforworkshed =>
      _dataLanddetails2Siteforworkshed;

  String? get dataLanddetails2Qtyofownland => _dataLanddetails2Qtyofownland;

  String? get dataOthers4 => _dataOthers4;

  String? get dataTrainingsrequired => _dataTrainingsrequired;

  String? get dataOthers3 => _dataOthers3;

  String? get dataComments => _dataComments;

  String? get dataNameofcrp => _dataNameofcrp;

  String? get dataNameofrespondent => _dataNameofrespondent;

  String? get dataDateofsurvey => _dataDateofsurvey;

  String? get dataStarttime => _dataStarttime;

  String? get dataMetaInstanceId => _dataMetaInstanceId;

  String? get key => _key;

  //-----------------------family----------------------//

  String? get dataFamilydetailsNameoffailyfmember =>
      _dataFamilydetailsNameoffailyfmember;

  String? get dataFamilydetailsRelation => _dataFamilydetailsRelation;

  String? get dataFamilydetailsAgeoffamilymember =>
      _dataFamilydetailsAgeoffamilymember;

  String? get dataFamilydetailsEducation => _dataFamilydetailsEducation;

  String? get dataFamilydetailsJob => _dataFamilydetailsJob;

  String? get dataFamilydetailsSkill => _dataFamilydetailsSkill;


  //-----------------product-----------------

  String? get dataProductsPrdct => _dataProductsPrdct;

  String? get dataProductsQuantum => _dataProductsQuantum;

  String? get dataProductsPrice2 => _dataProductsPrice2;


  //----------------purchaseofrawmaterials-------------

  String? get dataPurchaseofrawmaterialsItemtype => _dataPurchaseofrawmaterialsItemtype;
  String?
 get dataPurchaseofrawmaterialsQuantity => _dataPurchaseofrawmaterialsQuantity;
  String?
 get dataPurchaseofrawmaterialsPrice => _dataPurchaseofrawmaterialsPrice;
  String? get dataPurchaseofrawmaterialsBrand => _dataPurchaseofrawmaterialsBrand;
  String?
 get dataPurchaseofrawmaterialsOwn => _dataPurchaseofrawmaterialsOwn;
  String?
 get dataPurchaseofrawmaterialsRetail => _dataPurchaseofrawmaterialsRetail;
  String?
 get dataPurchaseofrawmaterialsP2 => _dataPurchaseofrawmaterialsP2;
  String?
 get dataPurchaseofrawmaterialsWholesale => _dataPurchaseofrawmaterialsWholesale;
  String?
 get dataPurchaseofrawmaterialsP3 => _dataPurchaseofrawmaterialsP3;
  String?
 get dataPurchaseofrawmaterialsGroup => _dataPurchaseofrawmaterialsGroup;
  String?
 get dataPurchaseofrawmaterialsP4 => _dataPurchaseofrawmaterialsP4;
  String?
 get dataPurchaseofrawmaterialsSubsidy => _dataPurchaseofrawmaterialsSubsidy;
  String?
 get dataPurchaseofrawmaterialsP5 => _dataPurchaseofrawmaterialsP5;


  //--------------sales----------------------------//

  String? get dataSalesprdct2 => _dataSalesprdct2;
  String? get dataSalesquntum2 => _dataSalesquntum2;
  String? get dataSalessalesmethod => _dataSalessalesmethod;


 //-------------------livelihood------------------------
  String? get datalivelihoodincomesource => _datalivelihoodincomesource;

  String? get datalivelihoodnumbers => _datalivelihoodnumbers;

  String? get datalivelihoodcapitalsource => _datalivelihoodcapitalsource;

  String? get datalivelihoodrevenue => _datalivelihoodrevenue;

  //----------------livelihood-----------------
  void updateDatalivelihoodincomesource(String? value) {
    _datalivelihoodincomesource = value;
    notifyListeners();
  }

  void updateDatalivelihoodnumbers(String? value) {
    _datalivelihoodnumbers = value;
    notifyListeners();
  }

  void updateDatalivelihoodcapitalsource(String? value) {
    _datalivelihoodcapitalsource = value;
    notifyListeners();
  }

  void updateDatalivelihoodrevenue(String? value) {
    _datalivelihoodrevenue = value;
    notifyListeners();
  }

  //------------------Sales-----------------------//

  void updateDataSalessalesmethod(String? value) {
    _dataSalessalesmethod = value;
    notifyListeners();
  }

  void updateDataSalesquntum2(String? value) {
    _dataSalesquntum2 = value;
    notifyListeners();
  }

  void updateDataSalesprdct2(String? value) {
    _dataSalesprdct2 = value;
    notifyListeners();
  }
// ---------------Products-----------------------//

  void updateDataProductsPrice2(String? value) {
    _dataProductsPrice2 = value;
    notifyListeners();
  }

  void updateDataProductsQuantum(String? value) {
    _dataProductsQuantum = value;
    notifyListeners();
  }

  void updateDataProductsPrdct(String? value) {
    _dataProductsPrdct = value;
    notifyListeners();
  }

  void updateDataparentKey(String? value) {
    _parentKey = value;
    notifyListeners();
  }
  //--------------------Family----------------------//

  void updateDataFamilydetailsSkill(String? value) {
    _dataFamilydetailsSkill = value;
    notifyListeners();
  }

  void updateDataFamilydetailsJob(String? value) {
    _dataFamilydetailsJob = value;
    notifyListeners();
  }

  void updateDataFamilydetailsEducation(String? value) {
    _dataFamilydetailsEducation = value;
    notifyListeners();
  }

  void updateDatadataFamilydetailsAgeoffamilymember(String? value) {
    _dataFamilydetailsAgeoffamilymember = value;
    notifyListeners();
  }

  void updateDataFamilydetailsNameoffailyfmember(String? value) {
    _dataFamilydetailsNameoffailyfmember = value;
    notifyListeners();
  }

  void updateDataFamilydetailsRelation(String? value) {
    _dataFamilydetailsRelation = value;
    notifyListeners();
  }
  //-----------------Data------------------------
  void updateDataDistrict(String? value) {
    _dataDistrict = value;
    notifyListeners();
  }

  void updateDataBlock(String? value) {
    _dataBlock = value;
    notifyListeners();
  }

  void updateDataPanchayath(String? value) {
    _dataPanchayath = value;
    notifyListeners();
  }

  void updateDataWard(String? value) {
    _dataWard = value;
    notifyListeners();
  }

  void updateDataName(String? value) {
    _dataName = value;
    notifyListeners();
  }

  void updateDataAddress(String? value) {
    _dataAddress = value;
  }

  void updateDataPhonenumber(String? value) {
    _dataPhonenumber = value;
    notifyListeners();
  }

  void updateDataClass(String? value) {
    _dataClass = value;
    notifyListeners();
  }

  void updateDataClass2(String? value) {
    _dataClass2 = value;
    notifyListeners();
  }

  void updateDataClass3(List<dynamic>? value) {
    _dataClass3 = value;
    notifyListeners();
  }

  void updateDataFamilyincome(String? value) {
    _dataFamilyincome = value;
    notifyListeners();
  }

  void updateDataNameofNg(String? value) {
    _dataNameofNg = value;
    notifyListeners();
  }

  void updateDataNameofNGmember(String? value) {
    _dataNameofNGmember = value;
    notifyListeners();
  }

  void updateDataRoleinNg(String? value) {
    _dataRoleinNg = value;
    notifyListeners();
  }

  void updateDataHouseownership(String? value) {
    _dataHouseownership = value;
    notifyListeners();
  }

  void updateDataLanddetailsLandarea(String? value) {
    _dataLanddetailsLandarea = value;
    notifyListeners();
  }

  void updateDataLanddetailsAgricultureland(String? value) {
    _dataLanddetailsAgricultureland = value ;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryBusinesstype(List<dynamic>? value) {
    _dataAnimalhusbendaryBusinesstype = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryOthers0(String? value) {
    _dataAnimalhusbendaryOthers0 = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryCdsregistration(String? value) {
    _dataAnimalhusbendaryCdsregistration = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryRegdetailsRegnumber(String? value) {
    _dataAnimalhusbendaryRegdetailsRegnumber = value;
    notifyListeners();
  }

  void updateDataAnimalhusbendaryRegdetailsCdsunitname(String? value) {
    _dataAnimalhusbendaryRegdetailsCdsunitname = value;
    notifyListeners();
  }

  void updateDataEnterpisetype(String? value) {
    _dataEnterpisetype = value;
    notifyListeners();
  }

  void updateDataNoofgroupmembers(String? value) {
    _dataNoofgroupmembers = value;
    notifyListeners();
  }

  void updateDataYearofstartingagriculture(String? value) {
    _dataYearofstartingagriculture = value;
    notifyListeners();
  }

  void updateDataYearofstartingbussiness(String? value) {
    _dataYearofstartingbussiness = value;
    notifyListeners();
  }

  void updateDataAmountinvested(String? value) {
    _dataAmountinvested = value;
    notifyListeners();
  }

  void updateDataSourceofinvestment(List<dynamic>? value) {
    _dataSourceofinvestment = "";
    print('before: ${_dataSourceofinvestment}');
    var values = "";
    value?.forEach((element) {
      values+='$element,';
    });
    _dataSourceofinvestment = values;
    print('After : ${_dataSourceofinvestment}');
    notifyListeners();

  }

  void updateDataSupportrecived(String? value) {
    _dataSupportrecived = value;
    notifyListeners();
  }

  void updateDataLoan(String? value) {
    _dataLoan = value;
    notifyListeners();
  }

  void updateDataTotalinvestment(String? value) {
    _dataTotalinvestment = value;
    notifyListeners();
  }

  void updateDataDateofLoanApplication(String? value) {
    _dataDateofLoanApplication = value;
    notifyListeners();
  }

  void updateDataBusinessidea(String? value) {
    _dataBusinessidea = value;
    notifyListeners();
  }

  void updateDataInfraInfrastructure(String? value) {
    _dataInfraInfrastructure = value;
    notifyListeners();
  }

  void updateDataInfraShed(String? value) {
    _dataInfraShed = value;
    notifyListeners();
  }

  void updateDataInfraWastage(String? value) {
    _dataInfraWastage = value;
    notifyListeners();
  }

  void updateDataInfraBiogas(String? value) {
    _dataInfraBiogas = value;
    notifyListeners();
  }

  void updateDataInfraEquipments(String? value) {
    _dataInfraEquipments = value;
    notifyListeners();
  }

  void updateDataInfraOthers(String? value) {
    _dataInfraOthers = value;
    notifyListeners();
  }

  void updateDataSupport(String? value) {
    _dataSupport = value;
    notifyListeners();
  }

  void updateDataOthers2(String? value) {
    _dataOthers2 = value;
    notifyListeners();
  }

  void updateDataMgnregAsupport(String? value) {
    _dataMgnregAsupport = value;
    notifyListeners();
  }

  void updateDataLanddetails1Landforgrass(String? value) {
    _dataLanddetails1Landforgrass = value;
    notifyListeners();
  }

  void updateDataLanddetails1Qtyofownland(String? value) {
    _dataLanddetails1Qtyofownland = value;
    notifyListeners();
  }

  void updateDataLanddetails1Qtyofleasedland(String? value) {
    _dataLanddetails1Qtyofleasedland = value;
    notifyListeners();
  }

  void updateDataLanddetails2Siteforworkshed(String? value) {
    _dataLanddetails2Siteforworkshed = value;
    notifyListeners();
  }

  void updateDataLanddetails2Qtyofownland(String? value) {
    _dataLanddetails2Qtyofownland = value;
    notifyListeners();
  }

  void updateDataOthers4(String? value) {
    _dataOthers4 = value;
    notifyListeners();
  }

  void updateDataTrainingsrequired(String? value) {
    _dataTrainingsrequired = value;
    notifyListeners();
  }

  void updateDataOthers3(String? value) {
    _dataOthers3 = value;
    notifyListeners();
  }

  void updateDataComments(String? value) {
    _dataComments = value;
    notifyListeners();
  }

  void updateDataNameofcrp(String? value) {
    _dataNameofcrp = value;
    notifyListeners();
  }

  void updateDataNameofrespondent(String? value) {
    _dataNameofrespondent = value;
    notifyListeners();
  }

  void updateDataDateofsurvey(String? value) {
    _dataDateofsurvey = value;
    notifyListeners();
  }

  void updateDataStarttime(String? value) {
    _dataStarttime = value;
    notifyListeners();
  }

  void updateDataMetaInstanceId(String? value) {
    _dataMetaInstanceId = value;
    notifyListeners();
  }

  void updateKey(String? value) {
    _key = value;
    notifyListeners();
  }

  //-----------------Purchase-------------------------
  void updateDataPurchaseofrawmaterialsItemtype(String? value) {
    _dataPurchaseofrawmaterialsItemtype = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsQuantity(String? value) {
    _dataPurchaseofrawmaterialsQuantity = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsPrice(String? value) {
    _dataPurchaseofrawmaterialsPrice = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsBrand(String? value) {
    _dataPurchaseofrawmaterialsBrand = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsOwn(String? value) {
    _dataPurchaseofrawmaterialsOwn = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsRetail(String? value) {
    _dataPurchaseofrawmaterialsRetail = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP2(String? value) {
    _dataPurchaseofrawmaterialsP2 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsWholesale(String? value) {
    _dataPurchaseofrawmaterialsWholesale = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP3(String? value) {
    _dataPurchaseofrawmaterialsP3 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsGroup(String? value) {
    _dataPurchaseofrawmaterialsGroup = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP4(String? value) {
    _dataPurchaseofrawmaterialsP4 = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsSubsidy(String? value) {
    _dataPurchaseofrawmaterialsSubsidy = value;
    notifyListeners();
  }

  void updateDataPurchaseofrawmaterialsP5(String? value) {
    _dataPurchaseofrawmaterialsP5 = value;
    notifyListeners();
  }
}
