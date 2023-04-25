import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/item/item_viewmodel.dart';
import 'package:organic_market/ui/views/item/widget/item_card.dart';
import 'package:stacked/stacked.dart';
import 'package:badges/badges.dart' as badges;

class ItemView extends StackedView<ItemViewModel> {
  const ItemView({super.key});

  @override
  Widget builder(BuildContext context, ItemViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: Text(viewModel.appbarTitle,
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ))),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () => viewModel.cartPage(),
                  icon: badges.Badge(
                      badgeContent: Text(
                        "${viewModel.totalquantity()}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        badgeColor: Colors.blue,
                        padding: const EdgeInsets.all(5),
                        borderRadius: BorderRadius.circular(4),
                        elevation: 0,
                      ),
                      child: const Icon(Icons.shopping_cart))),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                    // height: screenHeight(context) * 0.3,
                    ),
                GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: viewModel.itemList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.61,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Itemcard(
                      addtocart: () => viewModel.addToCart(
                          viewModel.itemdata(index).id,
                          viewModel.itemdata(index).title,
                          context),
                      imageUrl: viewModel.itemdata(index).imageUrl,
                      price: viewModel.itemdata(index).price,
                      quantity: viewModel.itemdata(index).quantity,
                      quantitytype: viewModel.itemdata(index).quantityType,
                      title: viewModel.itemdata(index).title,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  ItemViewModel viewModelBuilder(BuildContext context) => ItemViewModel();
  @override
  Future onViewModelReady(ItemViewModel viewModel) => viewModel.fetchData();
}
