// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              color: Colors.white,
              height: 80,
              width: 80,
              child: CachedNetworkImage(
                height: 155.4,
                imageUrl: viewModel.cartitemData(index).imageUrl,
                placeholder: (context, url) => Shimmer.fromColors(
                  child: Container(
                    color: Colors.grey,
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(viewModel.cartitemData(index).title,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 1,
                              color: Colors.black,
                              fontWeight: FontWeight.w600))),
                  Text("Rs.${viewModel.cartitemData(index).price}",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
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
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            "${viewModel.cartItemQuantity(viewModel.cartitemData(index).id)}",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                      ),
                      InkWell(
                        onTap: () => viewModel.incrementQuantity(
                            viewModel.cartitemData(index).id),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Icon(
                            CupertinoIcons.plus,
                            size: 18,
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
    );
  }
}
