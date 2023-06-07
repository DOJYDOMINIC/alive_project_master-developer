

import 'package:alive_project_master/constant/textdecor.dart';
import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../control/text_controller.dart';
import '../widgets/input_field.dart';
import 'crpdreport.dart';

class Livelihood extends StatefulWidget {
  const Livelihood({Key? key, required String parentid}) : super(key: key);

  @override
  State<Livelihood> createState() => _SalesState();
}

class _SalesState extends State<Livelihood> {

  TextEditingController datalivelihoodincomesource =
  TextEditingController();
  TextEditingController datalivelihoodnumbers =
  TextEditingController();
  TextEditingController datalivelihoodcapitalsource =
  TextEditingController();
  TextEditingController datalivelihoodrevenue =
  TextEditingController();

  void Livelihoodmain() {
    final CollectionReference datafive =
    FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);

    final data = {

      "datalivelihoodincomesource": providerone.datalivelihoodincomesource,
      "datalivelihoodnumbers": providerone.datalivelihoodnumbers,
      "datalivelihoodcapitalsource": providerone.datalivelihoodcapitalsource,
      "datalivelihoodrevenue": providerone.datalivelihoodrevenue,

      "KEY": DocumentId,
      "PARENT_KEY": DocumentId,
    };

    datafive.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: app_thea_color),
      body: Column(
        children: [
          // Text(DocumentId),
          InputField(hint: 'ഉപജീവന തൊഴിൽ', controller:datalivelihoodincomesource, onchanged: (value){providerone.updateDatalivelihoodincomesource(value);}),
          InputField(hint: 'എണ്ണം‌', controller: datalivelihoodnumbers, onchanged: (value){providerone.updateDatalivelihoodnumbers(value);}),
          InputField(hint: 'മൂലധന സ്രോതസ് (സ്വന്തം/പദ്ധതി) എഴുതുക', controller: datalivelihoodcapitalsource, onchanged: (value){providerone.updateDatalivelihoodcapitalsource(value);}),
          InputField(hint: 'പ്രീതിമാസം വരുമാനം ', controller: datalivelihoodrevenue, onchanged: (value){providerone.updateDatalivelihoodrevenue(value);}),
          ElevateClick(
              ontap: (){
                Livelihoodmain();
                Navigator.push(context, MaterialPageRoute(builder: (context) => CrpDetail(parentid: DocumentId,),));
              }, text:'Next'),
        ],
      ),
    );
  }
}
