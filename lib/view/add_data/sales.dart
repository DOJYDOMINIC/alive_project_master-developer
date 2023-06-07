
import 'package:alive_project_master/constant/textdecor.dart';
import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:alive_project_master/view/widgets/headings_between.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../control/text_controller.dart';
import '../widgets/input_field.dart';
import 'livelihood.dart';

class Sales extends StatefulWidget {
  const Sales({Key? key, required String parentid}) : super(key: key);

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {

  TextEditingController dataSalesprdct2 =
  TextEditingController();
  TextEditingController dataSalesquntum2 =
  TextEditingController();
  TextEditingController dataSalessalesmethod =
  TextEditingController();

  void Sales() {
    final CollectionReference datafour =
    FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);

    final data = {
      "dataSalesprdct2": providerone.dataSalesprdct2,
      "dataSalesquntum2": providerone.dataSalesquntum2,
      "dataSalessalesmethod": providerone.dataSalessalesmethod,
      "KEY": DocumentId,
      "PARENT_KEY": DocumentId,
    };

    datafour.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);
    return Scaffold(
      appBar: AppBar(backgroundColor: app_thea_color,),
      body: Column(
        children: [
          // Text(DocumentId),
          InputField(hint: 'ഉല്‍പ്പന്നം', controller:dataSalesprdct2, onchanged: (value){providerone.updateDataSalesprdct2(value);}),
          InputField(hint: 'അളവ്‌', controller: dataSalesquntum2, onchanged: (value){providerone.updateDataSalesquntum2(value);}),
          InputField(hint: 'വിപണന രീതി ', controller: dataSalessalesmethod, onchanged: (value){providerone.updateDataSalessalesmethod(value);}),
          ElevateClick(
              ontap: (){
            Sales();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Livelihood(parentid: DocumentId,),));
          }, text:'Next'),
        ],
      ),
    );
  }
}
