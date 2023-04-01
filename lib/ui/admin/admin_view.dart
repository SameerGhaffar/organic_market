import 'package:flutter/material.dart';

import 'package:organic_market/ui/admin/admin_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AdminView extends StackedView<AdminViewModel> {
  const AdminView({super.key});

  @override
  Widget builder(
      BuildContext context, AdminViewModel viewModel, Widget? child) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }

  @override
  AdminViewModel viewModelBuilder(BuildContext context) => AdminViewModel();
}
