import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  @override
  Widget builder(
      BuildContext context, AccountViewModel viewModel, Widget? child) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            child: Card(
              elevation: 1,
              color: Colors.white70,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                height: screenHeight(context) * 0.3,
                width: screenWidth(context) * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      child: Text(
                        "Profile Card",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                wordSpacing: 1,
                                letterSpacing: 2,
                                fontSize: 18,
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
                            textStyle: const TextStyle(
                                wordSpacing: 2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(viewModel.email() ?? "No Email Found",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => viewModel.logout(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.bottomRight,
                        child: const Icon(
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
          verticalSpaceMedium,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: viewModel.profileMenu.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(2),
              alignment: Alignment.center,
              child: InkWell(
                onTap: null,
                child: Card(
                  elevation: 1,
                  color: viewModel.profileMenuColor[index],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                    height: screenHeight(context) * 0.08,
                    width: screenWidth(context) * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //    alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 4),
                          child: Text(
                            viewModel.profileMenu[index],
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    wordSpacing: 1,
                                    letterSpacing: 2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                        ),
                        //const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8),
                          //   alignment: Alignment.centerRight,
                          child:
                              const Icon(Icons.keyboard_arrow_right, size: 30),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
  @override
  Future onViewModelReady(AccountViewModel viewModel) => viewModel.fetchData();
}
