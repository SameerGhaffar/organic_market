import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/checkout/checkout_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddressTextField extends ViewModelWidget<CheckoutViewModel> {
  @override
  Widget build(BuildContext context, CheckoutViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: viewModel.addressFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Shipping Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (value) => viewModel.addressValidator(value),
              showCursor: true,
              controller: viewModel.addressController,
              decoration: const InputDecoration(
                labelText: 'Shipping Address',
                filled: true,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                fillColor: Color(0xFFF2F3F5),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.location_on_sharp,
                  color: Color(0xFF666666),
                ),
                hintStyle: TextStyle(
                  color: Color(0xFF666666),
                  //hintText: "Phone Number",
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (value) => viewModel.addressValidator(value),
              showCursor: true,
              controller: viewModel.cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                filled: true,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                fillColor: Color(0xFFF2F3F5),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                prefixIcon: Icon(
                  Icons.location_on_sharp,
                  color: Color(0xFF666666),
                ),
                hintStyle: TextStyle(
                  color: Color(0xFF666666),
                  //hintText: "Phone Number",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => viewModel.updateAddress(),
                child: const Text('Add Address')),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Address :${viewModel.address}')),
          ],
        ),
      ),
    );
  }
}
