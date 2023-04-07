import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/item/item_viewmodel.dart';
import 'package:organic_market/ui/views/item/widget/item_card.dart';
import 'package:stacked/stacked.dart';

class ItemView extends StackedView<ItemViewModel> {
  const ItemView({super.key});

  @override
  Widget builder(BuildContext context, ItemViewModel viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Category Items",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ))),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.63,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: Itemcard(
                  addtocart: () =>
                      viewModel.addToCart(viewModel.itemdata(index).id),
                  imageUrl: viewModel.itemdata(index).imageUrl,
                  price: viewModel.itemdata(index).price,
                  quantity: viewModel.itemdata(index).quantity,
                  quantitytype: viewModel.itemdata(index).quantityType,
                  title: viewModel.itemdata(index).title,
                ),
              ),
            ),
          ),
        ));
  }

  @override
  ItemViewModel viewModelBuilder(BuildContext context) => ItemViewModel();
  @override
  Future onViewModelReady(ItemViewModel viewModel) => viewModel.fetchData();
}
