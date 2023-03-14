import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/pages/events/event_year_2019_page.dart';
import 'package:net_pro_fan/pages/events/event_year_2020_page.dart';
import 'package:net_pro_fan/pages/events/event_year_2021_page.dart';
import 'package:net_pro_fan/pages/events/event_year_2022_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventsProvider extends DisposableProvider {
  int? pageIndex;
  String? selectedYear;
  List<String> yearList = ['2019', '2020', '2021', '2022'];
  final pages = [
    {'year': '2019', 'data': const EventYear2019Page()},
    {'year': '2020', 'data': const EventYear2020Page()},
    {'year': '2021', 'data': const EventYear2021Page()},
    {'year': '2022', 'data': const EventYear2022Page()},
  ];

  void yearEventsChanged(String? request) {
    selectedYear = request;
    notifyListeners();
  }

  void linkChanged(bool newState, String link) {
    if (newState) {
      link.urlLauncher(mode: LaunchMode.externalApplication);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void onExpansionChanged() {
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    disposeValues();
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    pageIndex = null;
    selectedYear = null;
    // TODO: implement disposeValues
  }
}
