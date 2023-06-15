import 'package:alive_project_master/constant/textdecor.dart';
import 'package:alive_project_master/view/widgets/dropdown_nosearch.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:alive_project_master/view/widgets/headings_between.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../intro_page/lists.dart';
import '../widgets/dropdown_container_model.dart';
import '../widgets/input_field.dart';
import 'familydata.dart';


class PersonalData extends StatefulWidget {
  PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

final CollectionReference collectionRef =
FirebaseFirestore.instance.collection('dummydata');
DocumentReference newDocumentRef = collectionRef.doc();
String DocumentId = newDocumentRef.id;


class _PersonalDataState extends State<PersonalData> {



  TextEditingController dataName = TextEditingController();
  TextEditingController dataAddress = TextEditingController();
  TextEditingController dataPhonenumber = TextEditingController();
  TextEditingController dataNameofNg = TextEditingController();
  TextEditingController dataNameofNGmember = TextEditingController();
  TextEditingController dataYearofstartingagriculture = TextEditingController();
  TextEditingController dataYearofstartingbussiness = TextEditingController();
  TextEditingController dataAmountinvested = TextEditingController();
  TextEditingController dataSupportrecived = TextEditingController();
  TextEditingController dataBusinessidea = TextEditingController();
  TextEditingController dataDistrict = TextEditingController();
  TextEditingController dataBlock = TextEditingController();
  TextEditingController dataPanchayth = TextEditingController();
  TextEditingController dataWard = TextEditingController();
  TextEditingController dataClass = TextEditingController();
  TextEditingController dataClass2 = TextEditingController();
  TextEditingController dataClass3 = TextEditingController();
  TextEditingController dataFamilyincome = TextEditingController();
  TextEditingController datalanddetailslandarea = TextEditingController();
  TextEditingController dataSupport = TextEditingController();
  TextEditingController datalanddetailsagricultureland = TextEditingController();
  TextEditingController dataInfraOthers = TextEditingController();

  List dataclass3 = [];
  List dataAnimalhusbendaryBusinesstype =[];
  List dataSourceofinvestment = [];
  bool isYesSelected = false;
  bool showTextFields = false;
  // --------------------DateController---------------
  TextEditingController datePickerController = TextEditingController();
  TextEditingController selectedDateController = TextEditingController();
  // ----------------------------------------------------




  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

    Provider.of<TextMain>(context, listen: false).updateDataYearofstartingagriculture(formattedDate);
    datePickerController.text = formattedDate;
  }
  onTapFunction2({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(2015),
      initialDate: DateTime.now(),
    );

    if (pickedDate == null) return;
    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

    Provider.of<TextMain>(context, listen: false).updateDataYearofstartingbussiness(formattedDate);
    selectedDateController.text = formattedDate;
  }

  void addDataOne() {
    var providerone = Provider.of<TextMain>(context, listen: false);
    final data = {
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
      "data-meta-instanceID": providerone.dataMetaInstanceId,
      "PARENT_KEY" : DocumentId,
      "KEY": DocumentId,
    };
    collectionRef
        .doc(DocumentId)
        .set(data)
        .then((value) => print('Document added successfully $newDocumentRef'))
        .catchError((error) => print('Failed to add document: $error'));
  }

  @override
  void dispose() {
    // Dispose the text controllers
    dataName.dispose();
    dataAddress.dispose();
    dataPhonenumber.dispose();
    dataNameofNg.dispose();
    dataNameofNGmember.dispose();
    dataYearofstartingagriculture.dispose();
    dataYearofstartingbussiness.dispose();
    dataAmountinvested.dispose();
    dataSupportrecived.dispose();
    dataBusinessidea.dispose();
    dataDistrict.dispose();
    dataBlock.dispose();
    dataPanchayth.dispose();
    dataWard.dispose();
    dataClass.dispose();
    dataClass2.dispose();
    dataClass3.dispose();
    dataFamilyincome.dispose();
    datalanddetailslandarea.dispose();
    dataSupport.dispose();
    datalanddetailsagricultureland.dispose();
    dataInfraOthers.dispose();

    // Dispose other resources
    datePickerController.dispose();
    selectedDateController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_thea_color,
        title: Text('വ്യക്തിഗത വിശദാംശങ്ങൾ'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              NoSearchDropdown(
                items: districts,
                onChanged: (value) {
                  providerone.updateDataDistrict(value);
                },
                hint: 'ജില്ല',
              ),
              DropdownContainerModel(
                onChanged: (value) {
                  providerone.updateDataBlock(value);
                },
                hint: 'ബ്ലോക്ക്',
                items: block,
              ),
              DropdownContainerModel(onChanged: (value){providerone.updateDataPanchayath(value);}, items: panchayth, hint: 'പഞ്ചായത്ത്'),
              InputField(hint: 'വാർഡ്', controller:dataWard,keytype: TextInputType.number, onchanged: (value) { providerone.updateDataWard(value); },),
              InputField(hint: 'സംരംഭകയുടെ പേര്', controller:dataName, onchanged: (value) { providerone.updateDataName(value); },),
              InputField(hint: 'വിലാസം', controller: dataAddress, onchanged: (value){providerone.updateDataAddress(value);}),
              InputField(hint: 'ഫോൺ നമ്പർ', controller: dataPhonenumber, onchanged: (value){providerone.updateDataPhonenumber(value);},keytype: TextInputType.number),
              NoSearchDropdown(onChanged:(value){providerone.updateDataClass(value);} , items:dataclass, hint: 'കുടുംബ അവസ്ഥ'),
              NoSearchDropdown(onChanged: (value){providerone.updateDataClass2(value);}, items: dataclass2, hint: 'വിഭാഗം'),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: MultiSelectFormField(
                    title: Text('പ്രത്യേക വിഭാഗം',style: TextStyle(fontWeight: FontWeight.bold),),
                    dataSource: options,
                    textField: 'text',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataclass3,
                    onSaved: (value) {
                      if (value == null) return;
                      providerone.updateDataClass3(value);
                    },
                  ),
                ),
              ),
              NoSearchDropdown(onChanged: (value){providerone.updateDataFamilyincome(value);}, items: familyincome, hint: 'കുടുംബ മാസവരുമാനം'),
              InputField(hint: 'അയൽക്കൂട്ടത്തിന്റെ പേര്', controller: dataNameofNg, onchanged: (value){providerone.updateDataNameofNg(value);}),
              InputField(hint: 'അയൽക്കൂട്ട അംഗത്തിന്റെ പേര്', controller: dataNameofNGmember, onchanged: (value){providerone.updateDataNameofNGmember(value);}),
              NoSearchDropdown(onChanged:(value){providerone.updateDataRoleinNg(value);} , items: position, hint: 'അയൽക്കൂട്ടത്തിലെ പദവി'),
              NoSearchDropdown(onChanged:(value){providerone.updateDataHouseownership(value);}, items: house, hint: 'വീട് '),
              InputField(hint: 'പുരയിടം ( സെന്റ്)', controller: datalanddetailslandarea, onchanged: (value){providerone.updateDataLanddetailsLandarea(value);},keytype: TextInputType.number,),
              InputField(hint: ' നിലം (സെന്റ്)', controller:datalanddetailsagricultureland , onchanged: (value){providerone.updateDataLanddetailsAgricultureland(value);},keytype: TextInputType.number,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: MultiSelectFormField(
                    title: Text('മൃഗ സംരക്ഷണ മേഖലയിൽ ചെയ്യുന്ന ബിസിനസ്സ് ',style: TextStyle(fontWeight: FontWeight.bold),),
                    dataSource: businesstype,
                    textField: 'disply',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataAnimalhusbendaryBusinesstype,
                    onSaved: (value) {
                      if (value == null) return;
                      providerone.updateDataAnimalhusbendaryBusinesstype(value);
                    },
                  ),
                ),
              ),
            SizedBox(height: 10,),
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
                      onChanged:  (value) {
                        providerone.updateIsYesSelected(value!);
                        if (value) {
                          providerone.updateDataAnimalhusbendaryCdsregistration('YES');
                        }
                      },
                    ),
                    CheckboxListTile(
                      title: Text('No'),
                      value: !providerone.isYesSelected,
                      onChanged: (value) {
                        providerone.updateIsYesSelected(false);
                        if(value == false){
                          providerone.updateDataAnimalhusbendaryCdsregistration('NO');
                        }
                      },
                    ),
                    if (providerone.isYesSelected) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            providerone.updateDataAnimalhusbendaryRegdetailsRegnumber(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത നമ്പർ ',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            providerone.updateDataAnimalhusbendaryRegdetailsCdsunitname(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'CDS രജിസ്റ്റർ ചെയ്‌ത പേര് ',
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
              NoSearchDropdown(onChanged: (value){
                providerone.updateDataEnterpisetype(value);
              }, items: enterpricetype, hint: 'സംരഭം തരം'),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: datePickerController,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                    ),
                    onTap: () => onTapFunction(context: context),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: selectedDateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'കാർഷിക ഉപജീവനം ആരംഭിച്ച വർഷം',
                    ),
                    onTap: () => onTapFunction2(context: context),
                  ),
                ),
              ),
              InputField(hint: 'ഇതുവരെ സംരംഭത്തിൽ മുടക്കിയ  തുക', controller: dataAmountinvested, onchanged: (value){providerone.updateDataAmountinvested(value);},keytype: TextInputType.number,),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: MultiSelectFormField(
                    title: Text('മുടക്കുമുതൽ കണ്ടെത്തിയത് എവിടെനിന്ന് ',style: TextStyle(fontWeight: FontWeight.bold),),
                    dataSource: sourceofinvestment,
                    textField: 'source',
                    valueField: 'value',
                    okButtonLabel: 'OK',
                    cancelButtonLabel: 'CANCEL',
                    // hintText: 'Please select one or more options',
                    initialValue: dataSourceofinvestment,
                    onSaved: (value) {
                      if (value == null) return;
                      providerone.updateDataSourceofinvestment(value);
                    },
                  ),
                ),
              ),
              InputField(hint: 'ലഭിച്ച പിന്തുണകൾ', controller: dataSupportrecived, onchanged: (value){providerone.updateDataSupportrecived(value);}),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Headings(text: 'ലോൺ')
                  ),
                  CheckboxListTile(
                    title: Text('Applied'),
                    value: providerone.selectedOption == CheckboxOption.applied,
                    onChanged: (value) {
                      if (value ?? false) {
                        providerone.updateSelectedOption(CheckboxOption.applied,);
                        providerone.updateDataLoan('applied');
                      }
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Sanctioned'),
                    value: providerone.selectedOption == CheckboxOption.sanctioned,
                    onChanged: (value) {
                      if (value ?? false) {
                        providerone.updateSelectedOption(CheckboxOption.sanctioned);
                        providerone.updateDataLoan('sanctioned');

                      }
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Not Applied'),
                    value: providerone.selectedOption == CheckboxOption.notApplied,
                    onChanged: (value) {
                      if (value ?? false) {
                        providerone.updateSelectedOption(CheckboxOption.notApplied);
                        providerone.updateDataLoan('notApplied');
                      }
                    },
                  ),
                  if (providerone.selectedOption == CheckboxOption.applied ||
                      providerone.selectedOption == CheckboxOption.sanctioned)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: providerone.updateDataTotalinvestment,
                            decoration: InputDecoration(
                              labelText: 'തുക',
                            ),
                          ),
                          TextField(
                            onChanged: providerone.updateDataDateofLoanApplication,
                            decoration: InputDecoration(
                              labelText: 'തീയതി',
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
              InputField(hint: 'ബിസ്സിനെസ്സ് ഐഡിയ', controller: dataBusinessidea, onchanged: (value){providerone.updateDataBusinessidea(value);}),
              SizedBox(height: 10,),
              Headings(text: 'അടിസ്ഥാന സൗകര്യം'),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: Colors.black),
              //   ),
              //  child:
               Column(
                 children: [
                   NoSearchDropdown(onChanged: (value){providerone.updateDataInfraShed(value);}, items:condition, hint: 'ഷെഡ് / കൂട്'),
                   NoSearchDropdown(onChanged: (value){providerone.updateDataInfraWastage(value);}, items:condition, hint: 'വെസ്റ്റേജ്'),
                   NoSearchDropdown(onChanged: (value){providerone.updateDataInfraBiogas(value);}, items:condition, hint: 'ബയോഗ്യാസ്'),
                   NoSearchDropdown(onChanged: (value){providerone.updateDataInfraEquipments(value);}, items:condition, hint: 'ഉപകരണങ്ങൾ'),
                   InputField(hint: 'മറ്റുള്ളവ ', controller: dataInfraOthers,onchanged: (value) {providerone.updateDataInfraOthers(value);},),
                 ],
               ),
              // ),
              InputField(hint: 'ആവശ്യമായ പിൻതുണ/സഹായം ', controller: dataSupport, onchanged: (value){}),

              ElevateClick(ontap: (){
                addDataOne();
                Navigator.push(context, MaterialPageRoute(builder: (context) => FamilyData(parentid:DocumentId),));
              }, text: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
