

import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/add_data/product.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:alive_project_master/view/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/textdecor.dart';
import '../../control/text_controller.dart';

class FamilyData extends StatefulWidget {
   FamilyData({Key? key, required String parentid}) : super(key: key);

  @override
  State<FamilyData> createState() => _FamilyDataState();
}

class _FamilyDataState extends State<FamilyData> {
TextEditingController datafamilydetailsageoffamilymember = TextEditingController();
TextEditingController datafamilydetailsrelation = TextEditingController();
TextEditingController dataFamilydetailsEducation = TextEditingController();
TextEditingController dataFamilydetailsRelation = TextEditingController();
TextEditingController dataFamilydetailsSkill = TextEditingController();
TextEditingController dataFamilydetailsJob = TextEditingController();


  void Familydta() {
    final CollectionReference dataone =
    FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);

    final data = {

      "datafamilydetailsageoffamilymember":providerone.dataFamilydetailsAgeoffamilymember,
      "datafamilydetailseducation":providerone.dataFamilydetailsEducation,
      "datafamilydetailsjob":providerone.dataFamilydetailsJob,
      "datafamilydetailsnameoffailyfmember":providerone.dataFamilydetailsNameoffailyfmember,
      "datafamilydetailsrelation":providerone.dataFamilydetailsRelation,
      "datafamilydetailsskill" :providerone.dataFamilydetailsSkill,
      "PARENT_KEY":DocumentId,
      // 'KEY': '${DocumentId}'

    };
   dataone.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_thea_color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(child: Text('$DocumentId')),
          InputField(hint: 'കുടുംബാംഗത്തിൻ്റെ പേര് ', controller:datafamilydetailsageoffamilymember, onchanged: (value){providerone.updateDataFamilydetailsNameoffailyfmember(value);}),
          InputField(hint: 'ബന്ധം', controller: datafamilydetailsrelation, onchanged: (value){providerone.updateDataFamilydetailsRelation(value);}),
          InputField(hint: 'വയസ്സ്‌', controller:datafamilydetailsageoffamilymember, onchanged: (value){providerone.updateDatadataFamilydetailsAgeoffamilymember(value);},keytype: TextInputType.number,),
          InputField(hint: 'വിദ്യാഭ്യാസം', controller:dataFamilydetailsEducation, onchanged:(value){providerone.updateDataFamilydetailsEducation(value);}),
          InputField(hint: 'തൊഴില്‍', controller: dataFamilydetailsJob, onchanged: (value){providerone.updateDataFamilydetailsJob(value);}),
          InputField(hint: 'പ്രത്യേക കഴിവ്', controller: dataFamilydetailsSkill, onchanged: (value){providerone.updateDataFamilydetailsSkill(value);}),
          ElevateClick(ontap: (){
            Familydta();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Product(parentid : DocumentId),));
          }, text:'Next')
        ],
      ),
    );
  }
}
