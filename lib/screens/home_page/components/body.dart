import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_applicn_5/const_file.dart';
import 'package:ui_applicn_5/screens/home_page/provider_home_screen.dart';
import 'package:ui_applicn_5/screens/product_details/product_details_screen.dart';
import 'package:ui_applicn_5/widgets/custom_appbar.dart';
import 'package:ui_applicn_5/widgets/custom_drawer.dart';
import 'package:ui_applicn_5/widgets/product_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: paddingValue - 8,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: paddingValue + 4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "Welcome, ",
                                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "name",
                                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Have a nice shopping ahead!",
                                  style: GoogleFonts.poppins(),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: SizedBox(),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(
                                "OK",
                                textScaler: const TextScaler.linear(1),
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Foody",
          ),
          drawer: CustomDrawer(
            userDetails: homeProvider.userDetails,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Text(
                    "For You",
                    style: GoogleFonts.poppins(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.all(paddingValue - 10),
                        child: GestureDetector(
                            onTap: () => Navigator.pushNamed(context, ProductDetails.classId),
                            child: const ProductCard()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //filter
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        homeProvider.categories.length,
                        (index) {
                          return FilterContainer(
                            iconData: homeProvider.categories[index]['icon'] as IconData,
                            label: homeProvider.categories[index]['label'].toString(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Text(
                    "Near You",
                    style: GoogleFonts.poppins(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(paddingValue),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingValue * 2),
                          child: Text("Restaurent $index"),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

class FilterContainer extends StatelessWidget {
  final IconData iconData;
  final Image? iconImage;
  final String label;
  const FilterContainer({
    super.key,
    required this.iconData,
    required this.label,
    this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor,
              border: Border.all(
                color: const Color.fromARGB(255, 188, 188, 188).withOpacity(0.5),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Icon(
                    iconData,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  label,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
