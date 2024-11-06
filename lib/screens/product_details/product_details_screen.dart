import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/screens/product_details/components/body.dart';
import 'package:ui_applicn_5/screens/product_details/provider_product_details.dart';

class ProductDetails extends StatelessWidget {
  static const classId = '/ProductDetails';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsProvider(),
      child: const Body(),
    );
  }
}
