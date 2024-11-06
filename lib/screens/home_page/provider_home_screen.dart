import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeProvider extends ChangeNotifier {

  final categories = [
    {'icon': Bootstrap.egg_fried, 'label': 'Rice'},
    {'icon': Icons.fastfood, 'label': 'Snacks'},
    {'icon': Icons.local_bar, 'label': 'Drinks'},
    {'icon': MingCute.chicken_line, 'label': 'Meat'},
    {'icon': Icons.grid_view, 'label': 'More'},
  ];
}
