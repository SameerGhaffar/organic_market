import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:organic_market/ui/views/account/account_view.dart';
import 'package:organic_market/ui/views/cart/cart_view.dart';
//import 'package:organic_market/ui/views/chat_screen/chat_screen_view.dart';
import 'package:organic_market/ui/views/home/home_view.dart';
import 'package:organic_market/ui/views/layout/drawer_viewmodel.dart';
import 'package:organic_market/ui/views/searchproduct/search_product_view.dart';

import 'package:stacked/stacked.dart';

import 'appbar_widget.dart';

class DrawerViewNavbar extends ViewModelWidget<DrawerViewModel> {
  const DrawerViewNavbar({super.key});

  @override
  Widget build(Object context, DrawerViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DrawerViewMyAppBar(),
      body: Center(
          child: IndexedStack(
        index: viewModel.selctedindex,
        children: const [
          HomeView(),
          SearchProductView(),
          CartView(),
          AccountView(),
          // ChatScreenView()
        ],
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    tabActiveBorder: Border.all(
                        color: viewModel.colorList[viewModel.selctedindex]),
                    haptic: false,
                    rippleColor: Colors.grey[300]!,
                    hoverColor: Colors.grey[100]!,
                    gap: 8,
                    activeColor: viewModel.colorList[viewModel.selctedindex],
                    iconSize: 24,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    duration: const Duration(milliseconds: 300),
                    tabBackgroundColor: Colors.white.withOpacity(0.1),
                    color: Colors.black,
                    tabs: const [
                      GButton(
                        icon: CupertinoIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: CupertinoIcons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: CupertinoIcons.cart,
                        text: 'Cart',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: viewModel.selctedindex,
                    onTabChange: (index) => viewModel.updateindex(index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
