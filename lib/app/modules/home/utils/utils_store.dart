import 'package:flutter/material.dart';

class UtilsStore {
  String? validateRequiredField(String? text) {
    if (text == null || text.isEmpty) return 'Campo obrigatório';
    return null;
  }

  bool validateAndSave(GlobalKey<FormState> key) {
    final _form = key.currentState;
    if (_form?.validate() == true) {
      _form?.save();
      return true;
    } else {
      return false;
    }
  }
}
