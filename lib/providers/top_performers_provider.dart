import 'package:net_pro_fan/providers/disposable_provider.dart';

class TopPerFormersProvider extends DisposableProvider {
  int pageIndex = 0;

  void goToTopPerFormersPagesTab(int index) {
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
