import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import '../drawer_viewmodel.dart';

class DrawerViewDrawer extends ViewModelWidget<DrawerViewModel> {
  const DrawerViewDrawer({super.key});

  @override
  Widget build(BuildContext context, DrawerViewModel viewModel) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                      onPressed: () => viewModel.drawerToggle(),
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 30.px,
                      )),
                ),
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
                  onTap: () => viewModel.inDrawerUpdateIndex(0),
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
                  leading:
                      const Icon(Icons.person_outlined, color: Colors.blue),
                  onTap: () => viewModel.inDrawerUpdateIndex(3),
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
                  onTap: () => viewModel.inDrawerUpdateIndex(2),
                ),
                ListTile(
                  title: Text(
                    "Recipe Bot",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 17,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold)),
                  ),
                  leading: const Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  onTap: () => viewModel.onBotClick(),
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
