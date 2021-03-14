import 'package:flutter/material.dart';

class Filters {
  String label;
  IconData icon;
  Widget screen;

  Filters({this.icon, this.label, this.screen});
}

class FilterOptions {
  String label, type, value;
  bool selected;
  List<String> values;

  FilterOptions(
      {this.label, this.selected, this.type, this.value, this.values});
}
