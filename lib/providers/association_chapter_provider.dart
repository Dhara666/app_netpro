import 'dart:io';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/model/association_my_chapters_model.dart';
import 'package:net_pro_fan/pages/association/association_chapter/association_add_chapter/association_add_chapter_page.dart';
import 'package:net_pro_fan/pages/association/association_chapter/association_all_chapters/association_all_chapters_page.dart';
import 'package:net_pro_fan/pages/association/association_chapter/association_my_chapters/association_my_chapters_page.dart';
import 'package:net_pro_fan/pages/association/association_chapter/association_on_going_chapters/association_on_going_chapters_page.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/services/rest_service.dart';

class AssociationChapterProvider extends DisposableProvider {
  List<ChapterModel> myChaptersModels = <ChapterModel>[];
  List<ChapterModel> onGoingChaptersModels = <ChapterModel>[];
  List<ChapterModel> allChaptersModels = <ChapterModel>[];
  int pageIndex = 0;
  bool isLoading = true;
  final pages = [
    const AssociationMyChaptersPage(),
    const AssociationOnGoingChaptersPage(),
    const AssociationAddChapterPage(),
    const AssociationAllChaptersPage(),
  ];

  void goToAssociationChapterPageTab(int index) {
    pageIndex = index;
    notifyListeners();
  }

  Future<void> getMyChapters(context) async {
    try {
      String? getMyChapters = await RestServices.getRestCall(context, endpoint: RestConstants.associationMyChapterEndPoint);
      if (getMyChapters != null && getMyChapters.isNotEmpty) {
        logs('getMyChapters -->>$getMyChapters');
        AssociationChaptersModel associationChaptersModel = associationChaptersModelFromJson(getMyChapters);
        if (associationChaptersModel.chapterModels != null && associationChaptersModel.chapterModels!.isNotEmpty) {
          myChaptersModels = associationChaptersModel.chapterModels!;
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getMyChapters -->> ${e.message}');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getOnGoingChapters(context) async {
    try {
      String? getOnGoingChapters = await RestServices.getRestCall(context, endpoint: RestConstants.associationOnGoingChaptersEndPoint,);
      if (getOnGoingChapters != null && getOnGoingChapters.isNotEmpty) {
        logs('getOnGoingChapters -->>$getOnGoingChapters');
        AssociationChaptersModel associationChaptersModel = associationChaptersModelFromJson(getOnGoingChapters);
        if (associationChaptersModel.chapterModels != null && associationChaptersModel.chapterModels!.isNotEmpty) {
          onGoingChaptersModels = associationChaptersModel.chapterModels!;
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getOnGoingChapters -->> ${e.message}');
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllChapters(context) async {
    try {
      String? getAllChapters = await RestServices.getRestCall(context, endpoint: RestConstants.associationAllChaptersEndPoint,);
      if (getAllChapters != null && getAllChapters.isNotEmpty) {
        logs('getAllChapters -->>$getAllChapters');
        AssociationChaptersModel associationChaptersModel = associationChaptersModelFromJson(getAllChapters);
        if (associationChaptersModel.chapterModels != null && associationChaptersModel.chapterModels!.isNotEmpty) {
          allChaptersModels = associationChaptersModel.chapterModels!;
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception getAllChapters -->> ${e.message}');
    }
    isLoading = false;
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
