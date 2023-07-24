import 'package:organic_market/app/app.locator.dart';
import 'package:organic_market/services/nav_drawer_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrdercompletedViewModel extends BaseViewModel {
  final _navService = locator<NavigationService>();
  final _indexService = locator<NavDrawerindexService>();
  back() {
    _indexService.setIndex = 0;
    _navService.back();
  }
}
