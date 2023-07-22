import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/checkout/checkout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PaymentMethodSelection extends ViewModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel viewModel) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Payment Method:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Cash on Delivery'),
            leading: Radio(
              value: 0,
              groupValue: 0,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}
