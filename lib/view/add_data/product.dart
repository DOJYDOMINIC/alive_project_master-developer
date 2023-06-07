import 'package:alive_project_master/constant/textdecor.dart';
import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/add_data/purchaseofrawmaterials.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:alive_project_master/view/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';

class Product extends StatefulWidget {
  const Product({Key? key, required String parentid}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  TextEditingController dataProductsPrdct = TextEditingController();
  TextEditingController dataProductsQuantum = TextEditingController();
  TextEditingController dataProductsPrice2 = TextEditingController();

  void Product() {
    final CollectionReference datatwo =
        FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);

    final data = {
      "data-familydetailsageoffamilymember":
          providerone.dataFamilydetailsAgeoffamilymember,
      "data-familydetailseducation": providerone.dataFamilydetailsEducation,
      "data-familydetailsjob": providerone.dataFamilydetailsJob,
      "data-familydetailsnameoffailyfmember":
          providerone.dataFamilydetailsNameoffailyfmember,
      "data-familydetailsrelation": providerone.dataFamilydetailsRelation,
      "data-familydetailsskill": providerone.dataFamilydetailsSkill,
      "PARENT_KEY": DocumentId,
      'KEY': '${DocumentId}'
    };
    datatwo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: app_thea_color,),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      InputField(
          hint: 'ഉല്‍പ്പന്നം',
          controller: dataProductsPrdct,
          onchanged: (value) {
            providerone.updateDataProductsPrdct(value);
          }),
      InputField(
          hint: 'അളവ് /എണ്ണം ',
          controller: dataProductsQuantum,
          onchanged: (value) {
            providerone.updateDataProductsQuantum(value);
          }),
      InputField(
        hint: 'വില (Rs/KG/Lit/ Number)',
        controller: dataProductsPrice2,
        onchanged: (value) {
          providerone.updateDataProductsPrice2(value);
        },
        keytype: TextInputType.number,
      ),
      ElevateClick(
          ontap: () {
            Product();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Purchaseofrawmaterials(parentid: DocumentId),
                ));
          },
          text: 'Next'),
    ]));
  }
}
