import 'package:carbun/models/categories.dart';
import 'package:carbun/models/filtersCarbonEmission.dart';
import 'package:carbun/screens/carbonEmision/carbonEmission.dart';
import 'package:carbun/screens/coupons/coupons.dart';
import 'package:carbun/screens/information/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

/// Color Scheme for the app
//
final Color primaryColor = Colors.white;
final Color secondaryColor = Color(0xFF6666FF);
final Color textColor = Colors.black;
final Color shadowColor = Colors.black26;
final Color plantAccent = Color(0xFF15D12B);
final Color accentColor = Color(0xFF3300FF);

// Categories
List<Category> categories = [
  Category(title: 'carbon emission', icon: null, navigateTo: CarbonEmission()),
  Category(
      title: 'climate change', icon: Feather.home, navigateTo: Information()),
  Category(title: 'coupons', icon: Icons.money, navigateTo: Coupons()),
];

// Carbon Emission Calculator
List<Filters> filterList = [
  Filters(label: 'Flight', icon: FontAwesome.plane, screen: null),
  Filters(label: 'Car', icon: FontAwesome.car, screen: null),
  Filters(label: 'Cruise', icon: FontAwesome.ship, screen: null),
  Filters(label: 'Footprint', icon: Foundation.foot, screen: null),
  Filters(label: 'House-hold', icon: Foundation.home, screen: null),
  Filters(label: 'Company', icon: Icons.apartment, screen: null),
  Filters(label: 'Events', icon: Icons.event_available, screen: null),
];
