import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widgets/cart_cardwidget.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget builder(BuildContext context, CartViewModel viewModel, Widget? child) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.03,
              child: Text(
                "Total Items x ${viewModel.itemsInCart.length}",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        wordSpacing: 2,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
            ),
            Container(
                //temporary height
                margin: const EdgeInsets.only(bottom: 5),
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: const BoxDecoration(
                  color: Color(0xffedecf2),
                ),
                child: ListView.builder(
                  itemCount: viewModel.itemsInCart.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CartViewCard(index: index),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total : ${viewModel.totalprice()}",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontStyle: FontStyle.normal,
                          ),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
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
                        onPressed: () {},
                        child: Text(
                          "Check Out",
                          style:
                              GoogleFonts.lato(fontSize: 17, letterSpacing: 1),
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
}
