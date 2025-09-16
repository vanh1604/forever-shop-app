import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.icon, required this.label});
  final String label;
  final IconData icon;
}

const destinations = [
  Destination(icon: Icons.home_outlined, label: 'Home'),
  Destination(icon: Icons.production_quantity_limits, label: 'Shop'),
];
