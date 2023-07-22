import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';
import 'widgets/category_widget.dart';
import 'widgets/new_products_widget.dart';
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
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                elevation: 1,
                child: HomeViewMySlider(),
              ),
              HomeViewCategoryWidget(),
              HomeViewNewProductWidget(),
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
  @override
  Future onViewModelReady(HomeViewModel viewModel) => viewModel.fetchData();
}
