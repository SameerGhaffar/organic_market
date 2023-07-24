import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/cart/cart_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import 'widgets/cart_cardwidget.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        body: Container(
          height: screenHeight(context),
          padding: EdgeInsets.only(left: 6.px, right: 6.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.px),
                //margin: EdgeInsets.only(bottom: 1.px),
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.027,
                child: RichText(
                    text: TextSpan(
                        text: "Total Items ",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                letterSpacing: 2.px,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        children: <TextSpan>[
                      TextSpan(
                        text: "x ",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                wordSpacing: 2.px,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      ),
                      TextSpan(
                        text: "${viewModel.cartItemList.length}",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                wordSpacing: 2.px,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      )
                    ])),
              ),
              Container(
                  //temporary height
                  margin: EdgeInsets.only(bottom: 5.px),
                  height: screenHeight(context) * 0.615,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: ListView.builder(
                    itemCount: viewModel.cartItemList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        CartViewCard(index: index),
                  )),
              const Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: 1.px),
                padding: EdgeInsets.symmetric(horizontal: 8.px),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.px))),
                height: screenHeight(context) * 0.10,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.topLeft,
                      child: RichText(
                          text: TextSpan(
                              text: "Total : ",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      letterSpacing: 2.px,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              children: <TextSpan>[
                            TextSpan(
                              text: "Rs.${viewModel.totalprice()}",
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      letterSpacing: 2.px,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            )
                          ])),
                    ),

                    //sizebox of 15

                    // Login button
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 10.px),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(2.px),
                            backgroundColor: viewModel.cartItemList.isEmpty
                                ? MaterialStateProperty.all<Color>(
                                    Colors.green.shade100)
                                : MaterialStateProperty.all<Color>(
                                    Colors.green),
                          ),
                          onPressed: () => viewModel.cartItemList.isEmpty
                              ? null
                              : viewModel.checkout(),
                          child: viewModel.isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.black,
                                  value: 1,
                                )
                              : Text(
                                  "Check Out",
                                  style: GoogleFonts.lato(
                                      fontSize: 16.sp, letterSpacing: 1.px),
                                )),
                    ),
                    //size box i will implement google auth

                    //google auth
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
  @override
  Future onViewModelReady(CartViewModel viewModel) => viewModel.fetchData();
}
