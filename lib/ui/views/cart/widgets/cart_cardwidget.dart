// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'package:organic_market/ui/views/cart/cart_viewmodel.dart';

class CartViewCard extends ViewModelWidget<CartViewModel> {
  final int index;
  const CartViewCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, CartViewModel viewModel) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
        elevation: 1.px,
        child: Column(
          children: [
            (viewModel.cartitemData(index).isOnSale!)
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.px),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8.px))),
                      child: Text('Sale',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 3.px,
                            fontSize: 14.px,
                            fontWeight: FontWeight.bold,
                          ))),
                    ),
                  )
                : Container(),
            Container(
              height: 120.px,
              padding: EdgeInsets.all(8.px),
              margin: EdgeInsets.symmetric(horizontal: 4.px, vertical: 4.px),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.px)),
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: 95.px,
                    width: 80.px,
                    child: CachedNetworkImage(
                      height: 155.4.px,
                      imageUrl: viewModel.cartitemData(index).imageUrl,
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 11.px, vertical: 10.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(viewModel.cartitemData(index).title,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 17.px,
                                    letterSpacing: 1.px,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                        viewModel.cartitemData(index).isOnSale!
                            ? Column(
                                children: [
                                  Text(
                                      "Rs.${viewModel.cartitemData(index).price}",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationColor: Colors.black,
                                              decorationThickness: 1.5,
                                              fontSize: 14.px,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold))),
                                  Text(
                                      "Rs.${viewModel.cartitemData(index).changedPrice}",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              fontSize: 14.px,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold))),
                                ],
                              )
                            : Text("Rs.${viewModel.cartitemData(index).price}",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14.px,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => viewModel.deleteitemfromcart(
                                viewModel.cartitemData(index).id,
                                viewModel.cartitemData(index).title,
                                context),
                            child: const Icon(Icons.delete, color: Colors.red)),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => viewModel.decrimentQuantity(
                                  viewModel.cartitemData(index).id),
                              child: Container(
                                padding: EdgeInsets.all(4.px),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10.px,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18.px,
                                ),
                              ),
                            ),
                            Container(
                              width: 20.px,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 10.px),
                              child: Text(
                                  "${viewModel.cartItemQuantity(viewModel.cartitemData(index).id)}",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          wordSpacing: 2,
                                          fontSize: 16.px,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600))),
                            ),
                            InkWell(
                              onTap: () => viewModel.incrementQuantity(
                                  viewModel.cartitemData(index).id),
                              child: Container(
                                padding: EdgeInsets.all(4.px),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10.px,
                                      )
                                    ]),
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18.px,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
