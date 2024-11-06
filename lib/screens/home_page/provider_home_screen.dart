import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ui_applicn_5/services/user_model.dart';

class HomeProvider extends ChangeNotifier {
  final UserDetails? userDetails;
  HomeProvider(this.userDetails);

  final categories = [
    {'icon': Bootstrap.egg_fried, 'label': 'Rice'},
    {'icon': Icons.fastfood, 'label': 'Snacks'},
    {'icon': Icons.local_bar, 'label': 'Drinks'},
    {'icon': MingCute.chicken_line, 'label': 'Meat'},
    {'icon': Icons.grid_view, 'label': 'More'},
  ];
}
