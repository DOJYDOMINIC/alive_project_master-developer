
import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../control/text_controller.dart';
import '../widgets/input_field.dart';

class CrpDetail extends StatefulWidget {
  const CrpDetail({Key? key, required String parentid}) : super(key: key);

  @override
  State<CrpDetail> createState() => _SalesState();
}

class _SalesState extends State<CrpDetail> {

  TextEditingController datacomments =
  TextEditingController();
  TextEditingController datanameofcrp =
  TextEditingController();
  TextEditingController dataNameofrespondent =
  TextEditingController();

  void Crp() {
    final CollectionReference datasix =
    FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);

    final data = {
      "data-nameofcrp": providerone.dataNameofcrp,
      "data-Nameofrespondent": providerone.dataNameofrespondent,
      "data-dateofsurvey": providerone.dataDateofsurvey,
      "data-Starttime": providerone.dataStarttime,
      "KEY": DocumentId,
      "PARENT_KEY": DocumentId,
    };

    datasix.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          // Text(DocumentId),
          InputField(hint: 'CRP യുടെ പേര് ', controller:datanameofcrp, onchanged: (value){providerone.updateDataNameofcrp(value);}),
          InputField(hint: 'CRP യുടെ അഭിപ്രായങ്ങൾ രേഖപ്പെടുത്താം', controller: datacomments, onchanged: (value){providerone.updateDataComments(value);}),
          InputField(hint: 'വിവരം നൽകിയ വ്യക്തിയുടെ പേര് ', controller: dataNameofrespondent, onchanged: (value){providerone.updateDataNameofrespondent(value);}),
          ElevateClick(
              ontap: (){
                Crp();
              }, text:'Submit'),
        ],
      ),
    );
  }
}
