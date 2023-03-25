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
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          ListTile(
            title: Text(
              "Home",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            leading: const Icon(Icons.home),
            onTap: () => viewModel.updateindex(0),
          ),
          ListTile(
            title: Text(
              "Account",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            leading: const Icon(Icons.person),
            onTap: () => viewModel.updateindex(3),
          ),
          ListTile(
            title: Text(
              "Products Catalog",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            leading: const Icon(Icons.production_quantity_limits),
            onTap: () {},
          ),
          Container(
            margin: const EdgeInsets.only(top: 300),
            alignment: Alignment.bottomLeft,
            child: ListTile(
              title: Text(
                "Products Catalog",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              leading: const Icon(Icons.production_quantity_limits),
              onTap: () {},
            ),
          ),
        ]));
  }
}
