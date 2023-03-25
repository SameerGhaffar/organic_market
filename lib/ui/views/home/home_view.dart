import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:organic_market/ui/common/app_colors.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';
import 'widgets/category_widget.dart';
import 'widgets/promotion_widget.dart';
import 'widgets/slider_widget.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                elevation: 12,
                child: HomeViewMySlider(),
              ),
              HomeViewCategoryWidget(),
              HomeViewPromotion()
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
