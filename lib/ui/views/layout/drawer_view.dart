import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:organic_market/ui/views/layout/widgets/navbar_widget.dart';
import 'package:stacked/stacked.dart';

import 'drawer_viewmodel.dart';
import 'widgets/drawer_widget.dart';

class DrawerView extends StackedView<DrawerViewModel> {
  const DrawerView({super.key});

  @override
  Widget builder(
      BuildContext context, DrawerViewModel viewModel, Widget? child) {
    return ZoomDrawer(
      controller: viewModel.drawerControl,
      style: DrawerStyle.defaultStyle,
      menuScreen: const DrawerViewDrawer(),
      mainScreen: const DrawerViewNavbar(),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      drawerShadowsBackgroundColor: Colors.white,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  DrawerViewModel viewModelBuilder(BuildContext context) => DrawerViewModel();
  @override
  Future onViewModelReady(DrawerViewModel viewModel) => viewModel.fetchData();
}
