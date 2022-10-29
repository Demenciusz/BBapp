import 'package:flutter/material.dart';

DropdownButton kDropdownButton(
    {required int start,
    required int end,
    required int value,
    required Function? onChanged(value)}) {
  List<DropdownMenuItem<int>> dropdownItems = [];
  for (int i = start; i <= end; i++) {
    var newItem = DropdownMenuItem(
      child: Text('$i'),
      value: i,
    );
    dropdownItems.add(newItem);
  }
  return DropdownButton(
      value: value, items: dropdownItems, onChanged: onChanged);
}
