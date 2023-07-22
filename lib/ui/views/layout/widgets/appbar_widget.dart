import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/layout/drawer_viewmodel.dart';

import 'package:stacked/stacked.dart';

class DrawerViewMyAppBar extends ViewModelWidget<DrawerViewModel>
    implements PreferredSizeWidget {
  const DrawerViewMyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(Object context, DrawerViewModel viewModel) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => viewModel.drawerToggle(),
      ),
      title: Text(
        viewModel.title[viewModel.selctedindex],
        style: const TextStyle(
          letterSpacing: 1,
        ),
      ),
      centerTitle: true,
    );
  }
}
