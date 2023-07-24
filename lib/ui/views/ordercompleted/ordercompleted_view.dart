import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import 'ordercompleted_viewmodel.dart';

class OrdercompletedView extends StackedView<OrdercompletedViewModel> {
  const OrdercompletedView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrdercompletedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Order Completed!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Thank you for your order.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => viewModel.back(),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(2),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              child: Text(
                'Back to Home',
                style: GoogleFonts.lato(
                  fontSize: 17,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OrdercompletedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OrdercompletedViewModel();
}
