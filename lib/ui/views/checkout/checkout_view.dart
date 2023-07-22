import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/checkout/widgets/address.dart';
import 'package:organic_market/ui/views/checkout/widgets/card_checkout.dart';
import 'package:organic_market/ui/views/checkout/widgets/payment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';
import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('CheckOut',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                letterSpacing: 2.px,
                fontWeight: FontWeight.bold,
              ))),
          centerTitle: true,
        ),
        body: viewModel.getInfo
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.amber,
                        height: screenHeight(context) * 0.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Address",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () => viewModel.next(),
                                    child: Text(
                                      "Edit",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                viewModel.address,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          //temporary height
                          margin: EdgeInsets.only(bottom: 5.px),
                          height: screenHeight(context) * 0.615,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: ListView.builder(
                            itemCount: viewModel.cartList.length,
                            itemBuilder: (BuildContext context, int index) =>
                                CheckOutViewCard(index: index),
                          )),
                      Container(
                        alignment: Alignment.bottomCenter,
                        color: Colors.white,
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
                                    elevation:
                                        MaterialStateProperty.all<double>(2.px),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                  ),
                                  onPressed: () => () {},
                                  child: viewModel.isloading
                                      ? const CircularProgressIndicator(
                                          color: Colors.black,
                                          value: 1,
                                        )
                                      : Text(
                                          "Check Out",
                                          style: GoogleFonts.lato(
                                              fontSize: 16.sp,
                                              letterSpacing: 1.px),
                                        )),
                            ),
                            //size box i will implement google auth

                            //google auth
                          ],
                        ),
                      ),
                    ]))
            : Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: AddressTextField()),
                      Expanded(child: PaymentMethodSelection()),
                    ],
                  ),
                  Positioned(
                    bottom: 100,
                    right: screenWidth(context) * 0.2,
                    left: screenWidth(context) * 0.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () =>
                            viewModel.address.isEmpty ? null : viewModel.next(),
                        child: Text(
                          'Next',
                          style: GoogleFonts.lato(
                              color: viewModel.address.isEmpty
                                  ? Colors.white54
                                  : Colors.white,
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }

  @override
  CheckoutViewModel viewModelBuilder(BuildContext context) =>
      CheckoutViewModel();
  @override
  Future onViewModelReady(CheckoutViewModel viewModel) => viewModel.fetchData();
}
