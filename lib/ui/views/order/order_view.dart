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
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.receipt,
                                color: Colors.blue,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Order ID:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel.orderData(index).id,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.payment,
                                color: Colors.green,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Payment Method:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel.orderData(index).paymentMethod,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                viewModel.orderData(index).isCompleted
                                    ? Icons.check_circle
                                    : Icons.pending,
                                color: viewModel.orderData(index).isCompleted
                                    ? Colors.green
                                    : Colors.orange,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Status:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: viewModel.orderData(index).isCompleted
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel.orderData(index).isCompleted
                                    ? "Completed"
                                    : "In Progress",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.blue,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Time:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                viewModel
                                    .orderData(index)
                                    .timestamp
                                    .toString(), // Replace with formatted time
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shipping Address:",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "${viewModel.orderData(index).address}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Text(
                                "Total Amount:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${viewModel.orderData(index).totalAmount.toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
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
