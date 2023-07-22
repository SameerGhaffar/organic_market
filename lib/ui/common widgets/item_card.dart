// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import 'package:organic_market/ui/common/ui_helpers.dart';

class Itemcard extends StatelessWidget {
  final Function addtocart;
  final String imageUrl;
  final int quantity;
  final String quantitytype;
  final int price;
  final bool sale;
  final int changedPrice;
  final String title;

  const Itemcard({
    Key? key,
    required this.addtocart,
    required this.imageUrl,
    required this.quantity,
    required this.quantitytype,
    required this.price,
    required this.sale,
    required this.changedPrice,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.px),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sale
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8))),
                      child: Text('Sale',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3.px,
                            fontSize: 27.sp,
                            fontWeight: FontWeight.bold,
                          ))),
                    ),
                  )
                : Container(),
            const Spacer(
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.px)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.px),
                      child: CachedNetworkImage(
                        height: 160.px,
                        imageUrl: imageUrl,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.px, vertical: 2.px),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(title,
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      //overflow:,

                                      fontSize: 16.px,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal))),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.all(2.px),
                    alignment: Alignment.centerRight,
                    child: Text("$quantity" + quantitytype,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 14.px,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))),
                  ),
                  Divider(
                    color: Colors.black45,
                    height: 1.px,
                  ),
                  sale
                      ? Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Rs.$price",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.black,
                                          fontSize: 14.px,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold))),
                            ),
                            horizontalSpaceSmall,
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Rs.$changedPrice",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 14.px,
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.bold))),
                            ),
                          ],
                        )
                      : Align(
                          alignment: Alignment.topLeft,
                          child: Text("Rs.$price",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14.px,
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold))),
                        ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () => addtocart(),
                        child: const Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.green,
                        ),
                      )),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
