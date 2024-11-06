import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/screens/product_details/provider_product_details.dart';
import 'package:ui_applicn_5/widgets/custom_appbar.dart';
import 'package:ui_applicn_5/widgets/custom_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailsProvider>(
      builder: (context, productDetailsProvider, child) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Name",
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                const Center(
                  child: ProductDetails(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Text(
                    "Thank You For Adding a Tip!",
                    style: GoogleFonts.poppins(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: paddingValue),
                  width: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(paddingValue),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                "While you're celebrating with your loved ones, our delivery partners are working hard. Tip them and make their Diwali special too!",
                                style: GoogleFonts.poppins(color: Colors.black),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primaryColor,
                                  image: const DecorationImage(
                                      image: ExactAssetImage(
                                        tipGif,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              productDetailsProvider.tips.length,
                              (index) => GestureDetector(
                                onTap: () => productDetailsProvider.selectedintex = index,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                      color: productDetailsProvider.selectedintex == index
                                          ? Colors.deepOrange
                                          : primaryColor,
                                      width: productDetailsProvider.selectedintex == index ? 2.0 : 0.0,
                                    ),
                                  ),
                                  color: productDetailsProvider.selectedintex == index ? hintColor : primaryColor,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: paddingValue,
                                        horizontal: productDetailsProvider.selectedintex == index
                                            ? paddingValue
                                            : paddingValue + 10),
                                    child: Row(
                                      children: [
                                        Text(productDetailsProvider.tips[index]),
                                        if (productDetailsProvider.selectedintex == index)
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        if (productDetailsProvider.selectedintex == index)
                                          const Icon(
                                            Bootstrap.x_circle_fill,
                                            color: Colors.deepOrange,
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: productDetailsProvider.checkBoxValue,
                                onChanged: (value) {
                                  productDetailsProvider.checkBoxValue = !productDetailsProvider.checkBoxValue;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                "Add this tip automatically to future orders",
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
              ],
            ),
          )),
          bottomNavigationBar: CustomButton(
            isLoading: false,
            onPressed: () {},
            // onPressed: () => loginClick(context: context, loginFuction: loginPageProvider.login),
            child: Text(
              'Place Order',
              textScaler: const TextScaler.linear(1),
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(paddingValue + 6),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
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
              height: 20,
            ),
            const Text(
              "Cake Trends",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "4.1 (140) . 40-45 mins",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Perfect Cake Delivery",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "bakery, Cakes...",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              "Padapai . 3.0 km",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
