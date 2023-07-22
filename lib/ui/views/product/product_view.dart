import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';
import 'product_viewmodel.dart';
import 'package:badges/badges.dart' as badges;

import '../../common widgets/item_card.dart';

/// ye all products wala page hai
class ProductView extends StackedView<ProductViewModel> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProductViewModel viewModel, Widget? child) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
          appBar: AppBar(
            title: Text('All Products',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  letterSpacing: 2.px,
                  fontWeight: FontWeight.bold,
                ))),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.all(2.px),
                child: IconButton(
                    iconSize: 30.px,
                    onPressed: () => viewModel.cartPage(),
                    icon: badges.Badge(
                        badgeContent: Text(
                          "${viewModel.totalquantity()}",
                          style:
                              TextStyle(fontSize: 12.px, color: Colors.white),
                        ),
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.square,
                          badgeColor: Colors.blue,
                          padding: EdgeInsets.all(5.px),
                          borderRadius: BorderRadius.circular(4.px),
                          elevation: 0,
                        ),
                        child: const Icon(Icons.shopping_cart))),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.px),
              child: Column(
                children: [
                  Container(
                      // height: screenHeight(context) * 0.3,
                      ),
                  GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: viewModel.itemList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.57.px,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(2.0.px),
                      child: InkWell(
                        onTap: () => viewModel
                            .openProductSheet(viewModel.itemdata(index)),
                        child: Itemcard(
                          addtocart: () => viewModel.addToCart(
                              viewModel.itemdata(index).id,
                              viewModel.itemdata(index).title,
                              context),
                          sale: viewModel.itemdata(index).isOnSale!,
                          changedPrice: viewModel.itemdata(index).changedPrice!,
                          imageUrl: viewModel.itemdata(index).imageUrl,
                          price: viewModel.itemdata(index).price,
                          quantity: viewModel.itemdata(index).quantity,
                          quantitytype: viewModel.itemdata(index).quantityType,
                          title: viewModel.itemdata(index).title,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }

  @override
  ProductViewModel viewModelBuilder(BuildContext context) => ProductViewModel();
  @override
  Future onViewModelReady(ProductViewModel viewModel) => viewModel.fetchData();
}
