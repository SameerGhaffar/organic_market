import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widgets/cart_cardwidget.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.03,
              child: RichText(
                  text: TextSpan(
                      text: "Total Items ",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              letterSpacing: 2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                      children: <TextSpan>[
                    TextSpan(
                      text: "x ",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              wordSpacing: 2,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ),
                    TextSpan(
                      text: "${viewModel.cartItemList.length}",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              wordSpacing: 2,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)),
                    )
                  ])),
            ),
            Container(
                //temporary height
                margin: const EdgeInsets.only(bottom: 5),
                height: screenHeight(context) * 0.52,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: ListView.builder(
                  itemCount: viewModel.cartItemList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CartViewCard(index: index),
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: screenHeight(context) * 0.12,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: RichText(
                        text: TextSpan(
                            text: "Total : ",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            children: <TextSpan>[
                          TextSpan(
                            text: "Rs.${viewModel.totalprice()}",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    letterSpacing: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          )
                        ])),
                  ),

                  //sizebox of 15

                  // Login button
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(8.0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                        onPressed: () => viewModel.checkout(),
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                                value: 1,
                              )
                            : Text(
                                "Check Out",
                                style: GoogleFonts.lato(
                                    fontSize: 17, letterSpacing: 1),
                              )),
                  ),
                  //size box i will implement google auth

                  //google auth
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
  @override
  Future onViewModelReady(CartViewModel viewModel) => viewModel.fetchData();
}
