import 'package:net_pro_fan/pages/resources/fssai_resources/fssai_resources_page.dart';
import 'package:net_pro_fan/pages/resources/net_pro_fan_resources/net_pro_fan_resources_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class ResourcesProvider extends DisposableProvider {
  int pageIndex = 0;
  final pages = [
    const FssaiResourcesPage(),
    const NetProFanResourcesPage(),
  ];

  void goToResourcesPagesTab(int index) {
    pageIndex = index;
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    disposeValues();
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    pageIndex = 0;
    // TODO: implement disposeValues
  }
}
