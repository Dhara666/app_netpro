import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/model/chapter_activity_model.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';

class ChapterActivityProvider extends DisposableProvider {
  int? pageIndex;
  String? selectActivityCategory;
  List<ChapterActivityModel> selectedActivityCategoryData = [];

  List<String> activityCategory = [
    'CONTENT CREATION',
    'TRAINING & CAPACITY BUILDING ',
    'MASS DESSIMINATION',
    'OUTREACH ACTIVITY'
  ];
  final List<Map<String, dynamic>> activityCategoryDataList = [
    {
      'activityCategory': 'CONTENT CREATION',
      'data': AppList.contentCreationList
    },
    {
      'activityCategory': 'TRAINING & CAPACITY BUILDING ',
      'data': AppList.trainingCapacityList
    },
    {
      'activityCategory': 'MASS DESSIMINATION',
      'data': AppList.massDessiminationList
    },
    {
      'activityCategory': 'OUTREACH ACTIVITY',
      'data': AppList.outReachActivityList
    },
  ];

  void activityTypeOnChanged(String? request) {
    selectActivityCategory = request;
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
    selectActivityCategory = null;
    selectedActivityCategoryData = [];
    // TODO: implement disposeValues
  }
}