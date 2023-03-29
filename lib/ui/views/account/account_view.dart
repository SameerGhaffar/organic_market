import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StackedView<AccountViewModel> {
  const AccountView({super.key});

  @override
  Widget builder(
      BuildContext context, AccountViewModel viewModel, Widget? child) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Text(viewModel.name() ?? "not auth"),
          ElevatedButton(
            onPressed: viewModel.logout,
            child: const Text("Logout"),
          ),
        ],
      ),
    ));
  }

  @override
  AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}
