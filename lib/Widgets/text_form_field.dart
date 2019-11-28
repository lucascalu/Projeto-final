import 'package:flutter/material.dart';

Widget buildTextFormField(
    {TextEditingController controller, String error, String label}) {
  return Container(
    child: TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: label),
    style: TextStyle(fontSize: 23.0),
    controller: controller,
    validator: (text) {
      return text.isEmpty ? error : null;
    },
  ));
}
