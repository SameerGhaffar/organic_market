import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/checkout/checkout_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CheckOutViewCard extends ViewModelWidget<CheckoutViewModel> {
  final int index;
  const CheckOutViewCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, CheckoutViewModel viewModel) {
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
                      imageUrl: viewModel.cartitemData(index).imageUrl!,
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
                        Text(viewModel.cartitemData(index).name!,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 17.px,
                                    letterSpacing: 1.px,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600))),
                        Text("Rs.${viewModel.cartitemData(index).price}",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 14.px,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10.px),
                    child: Text(
                        "Quantity: ${viewModel.cartitemData(index).quantity}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                wordSpacing: 2,
                                fontSize: 16.px,
                                color: Colors.black,
                                fontWeight: FontWeight.w600))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
