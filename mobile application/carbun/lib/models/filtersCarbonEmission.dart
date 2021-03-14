import 'package:carbun/screens/carbonEmision/components.dart';
import 'package:flutter/material.dart';

class Filters {
  String label;
  IconData icon;
  Options screen;

  Filters({this.icon, this.label, this.screen});
}

class FilterOptions {
  String label, type;
  bool isDate;
  List<String> values;
  String output;

  FilterOptions({this.label, this.type, this.isDate, this.values, this.output});
}
