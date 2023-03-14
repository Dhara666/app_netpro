import 'package:flutter/cupertino.dart';

class ChapterDetailsProvider extends ChangeNotifier {
  void onExpansionChanged() {
    notifyListeners();
  }
}
