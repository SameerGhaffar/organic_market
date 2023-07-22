import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

/// Ye profile wala page hai
class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  @override
  Widget builder(
      BuildContext context, AccountViewModel viewModel, Widget? child) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(4.px),
            alignment: Alignment.center,
            child: Card(
              elevation: 1.px,
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.px)),
              child: SizedBox(
                height: Adaptive.h(30),
                width: 70.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(
                          horizontal: 22.px, vertical: 10.px),
                      child: Text(
                        "Profile Card",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                letterSpacing: 3.sp,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38)),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        viewModel.user?.name ?? "No Name",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                letterSpacing: 3.sp,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.px),
                      child: Text(viewModel.email() ?? "No Email Found",
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => viewModel.logout(),
                      child: Container(
                        padding: EdgeInsets.all(8.px),
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          size: 23.sp,
                          Icons.logout_rounded,
                          color: Colors.redAccent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: viewModel.profileMenu.length,
          //   itemBuilder: (context, index) => Container(
          //     padding: EdgeInsets.all(3.px),
          //     alignment: Alignment.center,
          //     child: InkWell(
          //       onTap: () => viewModel.onClick(index),
          //       child: Card(
          //         elevation: 4.sp,
          //         color: Colors.white,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(8.px)),
          //         child: SizedBox(
          //           height: 35.sp,
          //           width: 90.w,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 //    alignment: Alignment.centerLeft,
          //                 padding: EdgeInsets.symmetric(
          //                     horizontal: 22.px, vertical: 4.px),
          //                 child: Text(
          //                   viewModel.profileMenu[index],
          //                   style: GoogleFonts.lato(
          //                       textStyle: TextStyle(
          //                           letterSpacing: 2.sp,
          //                           fontSize: 18.sp,
          //                           fontWeight: FontWeight.bold,
          //                           color: Colors.black)),
          //                 ),
          //               ),
          //               //const Spacer(),
          //               Container(
          //                 padding: EdgeInsets.all(8.px),
          //                 //   alignment: Alignment.centerRight,
          //                 child: Icon(Icons.keyboard_arrow_right, size: 25.sp),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ));
    });
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
  @override
  Future onViewModelReady(AccountViewModel viewModel) => viewModel.fetchData();
}
