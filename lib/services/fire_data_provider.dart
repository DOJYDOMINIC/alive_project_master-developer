import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PeopleListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> itemDetails = [];
  DocumentSnapshot? lastVisibleDocument;

  Future<void> fetchDataFromFirestore({int limit = 50}) async {
    try {
      QuerySnapshot salesSnapshot = await FirebaseFirestore.instance
          .collection('sales')
          .limit(limit)
          .get();

      QuerySnapshot familyDetailsSnapshot = await FirebaseFirestore.instance
          .collection('familyDetails')
          .limit(limit)
          .get();

      // Extract data from the sales collection
      List<Map<String, dynamic>> salesData = salesSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Extract data from the familyDetail collection
      List<Map<String, dynamic>> familyDetailsData = familyDetailsSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Combine the data from both collections
      List<Map<String, dynamic>> combinedData = [
        ...familyDetailsData,
        ...salesData,
      ];
      itemDetails = combinedData;
      // print(itemDetails);
      notifyListeners();

      // Save the last visible document for pagination
      lastVisibleDocument =
          salesSnapshot.docs.isNotEmpty ? salesSnapshot.docs.last : null;

      List<dynamic> dropdownItems = combinedData.map((data) {
        return data['data-district'];
      }).toList();
    } catch (error) {
      // Handle any errors that occur during the data retrieval
      print('Error retrieving data: $error');
    }
  }

  Future<void> loadMoreData() async {
    try {
      if (lastVisibleDocument != null) {
        QuerySnapshot salesSnapshot = await FirebaseFirestore.instance
            .collection('sales')
            .startAfterDocument(lastVisibleDocument!)
            .limit(50)
            .get();

        QuerySnapshot familyDetailsSnapshot = await FirebaseFirestore.instance
            .collection('familyDetails')
            .startAfterDocument(lastVisibleDocument!)
            .limit(50)
            .get();

        // Extract data from the sales collection
        List<Map<String, dynamic>> salesData = salesSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Extract data from the familyDetail collection
        List<Map<String, dynamic>> familyDetailsData = familyDetailsSnapshot
            .docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        // Combine the data from both collections
        List<Map<String, dynamic>> combinedData = [
          ...familyDetailsData,
          ...salesData,
        ];

        // Append the new data to the existing itemDetails list
        itemDetails.addAll(combinedData);
        // print(itemDetails);
        notifyListeners();

        // Update the last visible document for subsequent pagination
        lastVisibleDocument =
            salesSnapshot.docs.isNotEmpty ? salesSnapshot.docs.last : null;
      }
    } catch (error) {
      // Handle any errors that occur during data retrieval
      print('Error loading more data: $error');
    }
  }
}
