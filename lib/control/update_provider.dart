
import 'package:flutter/material.dart';

class IndividualProvider extends ChangeNotifier {
  late TextEditingController nameController;

  IndividualProvider(Map<String, dynamic>? details) {
    String initialName = details?['data-Name'] ?? '';
    nameController = TextEditingController(text: initialName);
  }

  void updateName(String newName) {
    nameController.text = newName;
    notifyListeners();
  }
}