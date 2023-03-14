import 'package:flutter/cupertino.dart';

class PendingRequestProvider extends ChangeNotifier {
  void onExpansionChanged() {
    notifyListeners();
  }
}
