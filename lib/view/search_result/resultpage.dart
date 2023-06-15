import 'package:alive_project_master/constant/textdecor.dart';
import 'package:alive_project_master/view/intro_page/lists.dart';
import 'package:alive_project_master/view/widgets/dropdown_container_model.dart';
import 'package:alive_project_master/view/widgets/dropdown_nosearch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../control/text_controller.dart';
import '../widgets/input_field.dart';

class IndividualPage extends StatefulWidget {
  final String itemId;
  final Map<String, dynamic>? details;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  IndividualPage({Key? key, required this.itemId, this.details}) : super(key: key);

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  late TextEditingController dataName;
  late TextEditingController dataAddress;
  late TextEditingController dataPhonenumber;
  late TextEditingController dataNameofNg;
  late TextEditingController dataNameofNGmember;
  late TextEditingController dataYearofstartingagriculture;
  late TextEditingController dataYearofstartingbussiness;
  late TextEditingController dataAmountinvested;
  late TextEditingController dataSupportrecived;
  late TextEditingController dataBusinessidea;
  late TextEditingController dataDistrict;
  late TextEditingController dataBlock;
  late TextEditingController dataPanchayth;
  late TextEditingController dataWard;
  late TextEditingController dataClass;
  late TextEditingController dataClass2;
  late TextEditingController dataClass3;
  late TextEditingController dataFamilyincome;
  late TextEditingController datalanddetailslandarea;
  late TextEditingController dataSupport;
  late TextEditingController datalanddetailsagricultureland;
  late TextEditingController dataInfraOthers;
  late TextEditingController dataRoleinNg;
  late TextEditingController dataHouseownership;
  late TextEditingController dataAnimalhusbendaryRegdetailsRegnumber;
  late TextEditingController dataAnimalhusbendaryRegdetailsCdsunitname;




  @override
  void initState() {
    super.initState();
    // dataName = TextEditingController(text: widget.details?['data-Name']);
    // dataAddress = TextEditingController(text: widget.details?['data-Address']);
    // datanameofcrp = TextEditingController(text: widget.details?['data-nameofcrp']);
    // dataPhonenumber = TextEditingController(text: widget.details?['data-Phonenumber']);
    // dataClass = TextEditingController(text: widget.details?['data-Class']);
    // dataClass2 = TextEditingController(text: widget.details?['data-Class2']);
    // -------------------
    dataName = TextEditingController(text: widget.details?['data-Name']);
    dataAddress = TextEditingController(text: widget.details?['data-Address']);
    dataPhonenumber = TextEditingController(text: widget.details?['data-Phonenumber']);
    dataNameofNg = TextEditingController(text: widget.details?['data-NameofNG']);
    dataNameofNGmember = TextEditingController(text: widget.details?['data-NameofNGmember']);
    dataYearofstartingagriculture = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataYearofstartingbussiness = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataAmountinvested = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataSupportrecived = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataBusinessidea = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataDistrict = TextEditingController(text: widget.details?['data-district']);
    dataBlock = TextEditingController(text: widget.details?['data-Block']);
    dataPanchayth = TextEditingController(text: widget.details?['data-Panchayath']);
    dataWard = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataClass = TextEditingController(text: widget.details?['data-Class']);
    dataClass2 = TextEditingController(text: widget.details?['data-Class2']);
    dataClass3 = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataFamilyincome = TextEditingController(text: widget.details?['data-familyincome']);
    dataSupport = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataInfraOthers = TextEditingController(text: widget.details?['data-nameofcrp']);
    dataRoleinNg = TextEditingController(text: widget.details?['data-roleinNG']);
    dataHouseownership = TextEditingController(text: widget.details?['data-houseownership']);
    dataAnimalhusbendaryRegdetailsCdsunitname = TextEditingController(text: widget.details?['data-Animalhusbendary-regdetails-cdsunitname'] );
    //----------int---------
    var landArea = widget.details?['data-landdetails-landarea'] ?? 0;
    var agricultureLand = widget.details?['data-landdetails-agricultureland'] ?? 0;
    var regdetailsRegnumber = widget.details?['data-Animalhusbendary-regdetails-regnumber'] ?? 0;

    datalanddetailslandarea = TextEditingController(text: landArea.toString());
    datalanddetailsagricultureland = TextEditingController(text: agricultureLand.toString());
    dataAnimalhusbendaryRegdetailsRegnumber = TextEditingController(text:regdetailsRegnumber.toString() );


  }

  Future<void> updateDetails() async {
    var providerone = Provider.of<TextMain>(context);

    try {
      final updatedDetails = {
        "data-district": providerone.dataDistrict,
        "data-Block": providerone.dataBlock,
        "data-Panchayath": providerone.dataPanchayath,
        "data-Ward": providerone.dataWard,
        "data-Name": providerone.dataName,
        "data-Address": providerone.dataAddress,
        "data-Phonenumber": providerone.dataPhonenumber,
        "data-Class": providerone.dataClass,
        "data-Class2": providerone.dataClass2,
        "data-Class3": providerone.dataClass3,
        "data-familyincome": providerone.dataFamilyincome,
        "data-NameofNG": providerone.dataNameofNg,
        "data-NameofNGmember": providerone.dataNameofNGmember,
        "data-roleinNG": providerone.dataRoleinNg,
        "data-houseownership": providerone.dataHouseownership,
        "data-landdetails-landarea": providerone.dataLanddetailsLandarea,
        "data-landdetails-agricultureland": providerone.dataLanddetailsAgricultureland,
        "data-Animalhusbendary-businesstype": providerone.dataAnimalhusbendaryBusinesstype,
        "data-Animalhusbendary-others0": providerone.dataAnimalhusbendaryOthers0,
        "data-Animalhusbendary-cdsregistration": providerone.dataAnimalhusbendaryCdsregistration,
        "data-Animalhusbendary-regdetails-regnumber": providerone.dataAnimalhusbendaryRegdetailsRegnumber,
        "data-Animalhusbendary-regdetails-cdsunitname": providerone.dataAnimalhusbendaryRegdetailsCdsunitname,
        "data-enterpisetype": providerone.dataEnterpisetype,
        "data-noofgroupmembers": providerone.dataNoofgroupmembers,
        "data-Yearofstartingagriculture": providerone.dataYearofstartingagriculture,
        "data-yearofstartingbussiness": providerone.dataYearofstartingbussiness,
        "data-amountinvested": providerone.dataAmountinvested,
        "data-Sourceofinvestment": providerone.dataSourceofinvestment,
        "data-supportrecived": providerone.dataSupportrecived,
        "data-loan": providerone.dataLoan,
        "data-totalinvestment": providerone.dataTotalinvestment,
        "data-DateofLoanApplication": providerone.dataDateofLoanApplication,
        "data-businessidea": providerone.dataBusinessidea,
        "data-Infra-Infrastructure": providerone.dataInfraInfrastructure,
        "data-Infra-Shed": providerone.dataInfraShed,
        "data-Infra-wastage": providerone.dataInfraWastage,
        "data-Infra-biogas": providerone.dataInfraBiogas,
        "data-Infra-equipments": providerone.dataInfraEquipments,
        "data-Infra-others": providerone.dataInfraOthers,
        "data-support": providerone.dataSupport,
        "data-others2": providerone.dataOthers2,
        "data-MGNREGAsupport": providerone.dataMgnregAsupport,
        "data-landdetails1-landforgrass": providerone.dataLanddetails1Landforgrass,
        "data-landdetails1-qtyofownland": providerone.dataLanddetails1Qtyofownland,
        "data-landdetails1-qtyofleasedland": providerone.dataLanddetails1Qtyofleasedland,
        "data-landdetails2-siteforworkshed": providerone.dataLanddetails2Siteforworkshed,
        "data-landdetails2-qtyofownland": providerone.dataLanddetails2Qtyofownland,
        "data-others4": providerone.dataOthers4,
        "data-Trainingsrequired": providerone.dataTrainingsrequired,
        "data-others3": providerone.dataOthers3,
        "data-comments": providerone.dataComments,
      };

      await widget._firestore.collection('data').doc(widget.itemId).update(updatedDetails);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Details updated successfully')));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to update details')));
    }
  }

  //
  // @override
  // void dispose() {
  //   dataName.dispose();
  //   dataAddress.dispose();
  //   datanameofcrp.dispose();
  //   dataPhonenumber.dispose();
  //   dataClass.dispose();
  //   dataClass2.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_thea_color,
        title: Text('Individual Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputField(hint: 'സംരംഭകയുടെ പേര്', controller:dataName, onchanged: (value) { providerone.updateDataName(value); },),
              InputField(hint: 'വിലാസം', controller: dataAddress, onchanged: (value){providerone.updateDataAddress(value);}),
              InputField(hint: 'ഫോൺ നമ്പർ', controller: dataPhonenumber, onchanged: (value){providerone.updateDataPhonenumber(value);},keytype: TextInputType.number),
              NoSearchDropdown(items: districts, onChanged: (value) {providerone.updateDataDistrict(value);},hint: dataDistrict.text,),
              DropdownContainerModel(onChanged: (value) {providerone.updateDataBlock(value);}, hint: dataBlock.text, items: block,),
              DropdownContainerModel(onChanged: (value){providerone.updateDataPanchayath(value);}, items: panchayth, hint:dataPanchayth.text),
              NoSearchDropdown(onChanged:(value){providerone.updateDataClass(value);} , items:dataclass, hint: dataClass.text),
              NoSearchDropdown(onChanged: (value){providerone.updateDataClass2(value);}, items: dataclass2, hint: dataClass2.text),
              NoSearchDropdown(onChanged: (value){providerone.updateDataFamilyincome(value);}, items: familyincome, hint:dataFamilyincome.text),
              InputField(hint: 'അയൽക്കൂട്ടത്തിന്റെ പേര്', controller: dataNameofNg, onchanged: (value){providerone.updateDataNameofNg(value);}),
              InputField(hint: 'അയൽക്കൂട്ട അംഗത്തിന്റെ പേര്', controller: dataNameofNGmember, onchanged: (value){providerone.updateDataNameofNGmember(value);}),
              NoSearchDropdown(onChanged:(value){providerone.updateDataRoleinNg(value);} , items: position, hint: dataRoleinNg.text),
              NoSearchDropdown(onChanged:(value){providerone.updateDataHouseownership(value);}, items: house, hint:dataHouseownership.text),
              InputField(hint: 'പുരയിടം ( സെന്റ്)', controller: datalanddetailslandarea, onchanged: (value){providerone.updateDataLanddetailsLandarea(value);},keytype: TextInputType.number,),
              InputField(hint: ' നിലം (സെന്റ്)', controller:datalanddetailsagricultureland , onchanged: (value){providerone.updateDataLanddetailsAgricultureland(value);},keytype: TextInputType.number,),
             SizedBox(height:10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'സംരംഭം CDSൽ  രജിസ്റ്റർ ചെയ്‌തിട്ടുണ്ടോ ? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CheckboxListTile(
                        title: Text('Yes'),
                        value: providerone.isYesSelected,
                        onChanged: (value) {
                          providerone.updateIsYesSelected(value ?? false);
                          if (value!) {
                            providerone.updateDataAnimalhusbendaryCdsregistration('YES');
                          }
                        },
                      ),
                      CheckboxListTile(
                        title: Text('No'),
                        value: !providerone.isYesSelected,
                        onChanged: (value) {
                          providerone.updateIsYesSelected(!value!);
                          if (!value) {
                            providerone.updateDataAnimalhusbendaryCdsregistration('NO');
                          }
                        },
                      ),
                      if (providerone.isYesSelected) ...[
                        // Show the text fields if the 'Yes' checkbox is selected
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: dataAnimalhusbendaryRegdetailsRegnumber,
                            onChanged: (value) {
                              providerone.updateDataAnimalhusbendaryRegdetailsRegnumber(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'CDS രജിസ്റ്റർ ചെയ്ത നമ്പർ ',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: dataAnimalhusbendaryRegdetailsCdsunitname,
                            onChanged: (value) {
                              providerone.updateDataAnimalhusbendaryRegdetailsCdsunitname(value);
                            },
                            decoration: InputDecoration(
                              labelText: 'CDS രജിസ്റ്റർ ചെയ്ത പേര് ',
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: updateDetails,
                child: Text('Update Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
