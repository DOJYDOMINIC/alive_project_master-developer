import 'package:alive_project_master/control/dropdown_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../control/text_controller.dart';
import '../view/intro_page/lists.dart';
import '../view/widgets/dropdown_container_model.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ModelProvider>(context);
    // Stream<QuerySnapshot<Map<String, dynamic>>> datamain;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:

        // datamain =

            FirebaseFirestore.instance
            .collection("dummmydata")
            .where("data-district", isEqualTo: 'Alappuzha')
            .where("data-Block", isEqualTo: 'Aryad')
            .where("data-panchayath", isEqualTo: "marari")
            .where("data-nameofcrp", isEqualTo: "anju")
            .limit(100)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            final data = snapshot.data!.docs.first.data() as Map<String, dynamic>;
            final dataNameOfCrp = data['data-nameofcrp'] as String;
            return SafeArea(
              child: Column(
                children: [
                  DropdownContainerModel(
                    items: districts,
                    onChanged: (value) {
                      provider.updatejilla(value);
                    },
                    hint: 'ജില്ല',
                  ),
                  Center(child: Text(dataNameOfCrp)),
                ],
              ),
            );
          } else {
            return Text('No data available.');
          }
        },
      ),
    );
  }
}
