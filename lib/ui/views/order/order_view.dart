import 'package:flutter/material.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'order_viewmodel.dart';

class OrderView extends StackedView<OrderViewModel> {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: screenHeight(context),
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: ListView.builder(
            itemCount: viewModel.orderList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    elevation: 1,
                    child: Container(
                      height: screenHeight(context) * 0.28,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "OrderID :",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              Container(
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    viewModel.orderData(index).id,
                                    style: const TextStyle(fontSize: 16),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  @override
  OrderViewModel viewModelBuilder(BuildContext context) => OrderViewModel();
  @override
  Future onViewModelReady(OrderViewModel viewModel) => viewModel.fetchData();
}
