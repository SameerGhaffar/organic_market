import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../drawer_viewmodel.dart';

class DrawerViewDrawer extends ViewModelWidget<DrawerViewModel> {
  const DrawerViewDrawer({super.key});

  @override
  Widget build(BuildContext context, DrawerViewModel viewModel) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            ListTile(
              title: Text(
                "Home",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),
              ),
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.purple,
              ),
              onTap: () => viewModel.updateindex(0),
            ),
            ListTile(
              title: Text(
                "Profile",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),
              ),
              leading: const Icon(Icons.person_outlined, color: Colors.blue),
              onTap: () => viewModel.updateindex(3),
            ),
            ListTile(
              title: Text(
                "Cart",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold)),
              ),
              leading: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.green,
              ),
              onTap: () => viewModel.updateindex(2),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text(
                  "Logout",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 17,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600)),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                onTap: () => viewModel.logout(),
              ),
            ),
          ]),
        ));
  }
}
