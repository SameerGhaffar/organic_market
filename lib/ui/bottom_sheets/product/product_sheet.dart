import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'product_sheet_model.dart';

class ProductSheet extends StackedView<ProductSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ProductSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductSheetModel viewModel,
    Widget? child,
  ) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      {
        return Container(
          height: screenHeight(context),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                viewModel.item().isOnSale ?? false
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
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                              ))),
                        ),
                      )
                    : Container(),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      color: Colors.black.withOpacity(0.05),
                      child: CachedNetworkImage(
                        height: 145.px,
                        width: 150.px,
                        imageUrl: viewModel.item().imageUrl,
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 145.px,
                            width: 150.px,
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.px, vertical: 2.px),
                    alignment: Alignment.topCenter,
                    child: Text(viewModel.item().title,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 25.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)))),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.px, vertical: 2.px),
                  alignment: Alignment.centerRight,
                  child: Text(
                      "${viewModel.item().quantity}" +
                          viewModel.item().quantityType,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                ),
                Divider(
                  color: Colors.black45,
                  height: 1.px,
                ),
                viewModel.item().isOnSale!
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text("Rs.${viewModel.item().price}",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.black,
                                        decorationThickness: 1.5,
                                        fontSize: 21.sp,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold))),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text("Rs.${viewModel.item().changedPrice}",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 21.sp,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold))),
                          ),
                        ],
                      )
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Text("Rs.${viewModel.item().price}",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold))),
                      ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Description",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 21.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.px),
                      alignment: Alignment.topLeft,
                      child: Text(viewModel.item().description,
                          maxLines: 2,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () => viewModel.addToCart(
                          viewModel.item().id, viewModel.item().title, context),
                      icon: Icon(
                        // <-- Icon
                        Icons.shopping_basket,
                        size: 24.px,
                      ),
                      label: Text('ADD TO CART',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))) // <-- Text
                      ),
                )
              ],
            ),
          ),
        );
      }
    });
  }

  @override
  ProductSheetModel viewModelBuilder(BuildContext context) =>
      ProductSheetModel();
}
