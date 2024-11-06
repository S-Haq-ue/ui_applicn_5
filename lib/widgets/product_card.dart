import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ui_applicn_5/const_file.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: Stack(
        children: [
          const Positioned(
            top: 20,
            right: 20,
            child: Icon(
              Bootstrap.three_dots_vertical,
              color: Colors.grey,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(paddingValue + 4),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: primaryColor),
                      ),
                      const Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          Bootstrap.heart,
                          color: Colors.grey,
                        ),
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "FLAT DEAL",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹125 OFF",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "ABOVE ₹199",
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Cake Trends",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "4.1 (140) . 40-45 mins",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Perfect Cake Delivery",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "bakery, Cakes...",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Text(
                        "Padapai . 3.0 km",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),),
        ],
      ),
    );
  }
}
