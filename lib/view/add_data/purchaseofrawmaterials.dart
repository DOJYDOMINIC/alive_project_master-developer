import 'package:alive_project_master/view/add_data/personal_data.dart';
import 'package:alive_project_master/view/add_data/sales.dart';
import 'package:alive_project_master/view/widgets/elevate_click_button.dart';
import 'package:alive_project_master/view/widgets/headings_between.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../control/text_controller.dart';
import '../widgets/input_field.dart';

class Purchaseofrawmaterials extends StatefulWidget {
  const Purchaseofrawmaterials({Key? key, required String parentid})
      : super(key: key);

  @override
  State<Purchaseofrawmaterials> createState() => _PurchaseofrawmaterialsState();
}

class _PurchaseofrawmaterialsState extends State<Purchaseofrawmaterials> {
  TextEditingController dataPurchaseofrawmaterialsItemtype =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsQuantity =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsPrice =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsBrand =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsOwn =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsRetail =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP2 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsWholesale =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP3 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsGroup =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP4 =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsSubsidy =
      TextEditingController();
  TextEditingController dataPurchaseofrawmaterialsP5 =
      TextEditingController();

  void Purchase() {
    final CollectionReference datathree =
        FirebaseFirestore.instance.collection('login');

    var providerone = Provider.of<TextMain>(context, listen: false);
    final data = {
      "datapurchaseofrawmaterialsitemtype":
          providerone.dataPurchaseofrawmaterialsItemtype,
      "datapurchaseofrawmaterialsquantity":
          providerone.dataPurchaseofrawmaterialsQuantity,
      "datapurchaseofrawmaterialsprice":
          providerone.dataPurchaseofrawmaterialsPrice,
      "datapurchaseofrawmaterialsbrand":
          providerone.dataPurchaseofrawmaterialsBrand,
      "datapurchaseofrawmaterialsown":
          providerone.dataPurchaseofrawmaterialsOwn,
      "datapurchaseofrawmaterialsretail":
          providerone.dataPurchaseofrawmaterialsRetail,
      "datapurchaseofrawmaterialsp2": providerone.dataPurchaseofrawmaterialsP2,
      "datapurchaseofrawmaterialswholesale":
          providerone.dataPurchaseofrawmaterialsWholesale,
      "datapurchaseofrawmaterialsp3": providerone.dataPurchaseofrawmaterialsP3,
      "datapurchaseofrawmaterialsgroup":
          providerone.dataPurchaseofrawmaterialsGroup,
      "datapurchaseofrawmaterialsp4": providerone.dataPurchaseofrawmaterialsP4,
      "datapurchaseofrawmaterialssubsidy":
          providerone.dataPurchaseofrawmaterialsSubsidy,
      "datapurchaseofrawmaterialsp5": providerone.dataPurchaseofrawmaterialsP5,
      "KEY": DocumentId,
      "PARENT_KEY": DocumentId,
    };
    datathree.add(data);
  }

  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<TextMain>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Headings(text: 'അസംസ്‌കൃത വസ്തുക്കൾ വാങ്ങുന്നരീതി'),
            InputField(
              hint: 'ഇനം',
              controller: dataPurchaseofrawmaterialsItemtype,
              onchanged: (value) {
                providerone.updateDataPurchaseofrawmaterialsItemtype(value);
              },
            ),
            InputField(
              hint: 'വാങ്ങുന്ന അളവ് (മാസം/kg ltr)',
              controller: dataPurchaseofrawmaterialsQuantity,
              onchanged: (value) {
                providerone.updateDataPurchaseofrawmaterialsQuantity(value);
              },
            ),
            InputField(hint: 'വാങ്ങുന്ന വില (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsPrice, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsPrice(value);}),
            InputField(hint: 'ബ്രാൻഡ്', controller: dataPurchaseofrawmaterialsBrand, onchanged:(value){providerone.updateDataPurchaseofrawmaterialsBrand(value);}),
            InputField(hint: 'സ്വയം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsOwn, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsOwn(value);}),
            InputField(hint: 'റീറ്റെയ്ൽ (മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsRetail, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsRetail(value);}),
            InputField(hint: 'വില ', controller:dataPurchaseofrawmaterialsP2, onchanged: (value){providerone.updateDataProductsPrice2(value);}),
            InputField(hint: 'ഹോൾസെയിൽ ', controller: dataPurchaseofrawmaterialsWholesale, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsWholesale(value);}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP3, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsP3(value);}),
            InputField(hint: 'സംഘം(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsGroup, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsGroup(value);}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP4, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsP4(value);}),
            InputField(hint: 'സബ്‌സിഡി(മാസം/kg ltr)', controller: dataPurchaseofrawmaterialsSubsidy, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsSubsidy(value);}),
            InputField(hint: 'വില ', controller: dataPurchaseofrawmaterialsP5, onchanged: (value){providerone.updateDataPurchaseofrawmaterialsP5(value);}),
            // Text(DocumentId),
            ElevateClick(
                ontap: () {
                  Purchase();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sales(parentid : DocumentId),));
                },
                text: 'Next')
          ],
        ),
      ),
    );
  }
}
