import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_pro_fan/app/widget/app_date_picker.dart';
import 'package:net_pro_fan/app/widget/app_photo_view.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/model/add_convenor_activity_model.dart';
import 'package:net_pro_fan/providers/add_activity_provider.dart';
import 'package:net_pro_fan/services/db_helper.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class SelectedActivityTypeProvider extends ChangeNotifier {
  String? activityName;
  String? numberOfMemberInvolved;
  String? levelOfActivity;
  File? chooseDoc;
  DateTime? selectedDate;
  TextEditingController nameOfMembersInvolvedController =
      TextEditingController();

  Future<void> selectDateFunction(BuildContext context) async {
    selectedDate = await AppDatePicker.selectDate(context, selectedDate);
    notifyListeners();
  }

  Future<void> selectDocFunction() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.isNotEmpty) {
        for (var element in result.files) {
          if (element.extension == 'png' ||
              element.extension == 'jpg' ||
              element.extension == 'jpeg' ||
              element.extension == 'doc' ||
              element.extension == 'pdf') {
            logs('size-->${element.size}');
            double kb = element.size / 1024;
            double mb = kb / 1024;
            logs('mb-->$mb');
            if (mb > 5) {
              'Uploaded file size: ${mb.toStringAsFixed(2)} MB but File size limit : 5 MB'.showToast(isError: true);
            } else {
              chooseDoc = File(element.path!);
            }
          } else {
            "${element.extension!.split('.').last} file are not allowed".showToast(isError: true);
          }
        }
        logs('selectedImageList Image from Gallery --> ');
        notifyListeners();
      }
    } on PlatformException catch (e) {
      e.message!.showToast(isError: true);
    }
  }

  docViewFunction(BuildContext context) async {
    if (chooseDoc!.path.split('.').last == 'png' ||
        chooseDoc!.path.split('.').last == 'jpg' ||
        chooseDoc!.path.split('.').last == 'jpeg') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AppPhotoView(
                fileImage: chooseDoc,
                url: '',
                isAppbar: true,
              )));
    } else {
      OpenFile.open(chooseDoc!.path);
    }
  }
  List<String> activityNameItem = [
    'Organise and facilitate training programs for frontline health workers',
    'Faculty development workshop for faculty, practicing professionals on Eat Right messages ',
    'FoSTaC training',
  ];
  List<String> numberOfMember = [
    '4',
    '8',
    '12',
    '16',
    '20+',
  ];
  List<String> levelOfActivityItem = [
    'Organize and facilitate training programs for front line health workers with 150 participants',
    'Organize and facilitate training programs for front line health workers with 100 participants',
    'Organize and facilitate training programs for front line health workers with 50 participants',
    'Faculty development workshop with minimum 12 participants',
    'FoSTaC training with minimum 20 participants',
  ];

  void activityNameOnChanged(String? request) {
    activityName = request;
    notifyListeners();
  }

  void numberOfMemberInvolvedOnChanged(String? request) {
    numberOfMemberInvolved = request;
    notifyListeners();
  }

  void levelOfActivityOnChanged(String? request) {
    levelOfActivity = request;
    notifyListeners();
  }

  Future<void> validateForm(context) async {
    AddActivityProvider addActivityProvider =
        Provider.of<AddActivityProvider>(context, listen: false);
    if (activityName == null) {
      S.of(context).pleaseSelectAnActivityNameInTheList.showSnackbar(context);
    } else if (selectedDate == null) {
      S.of(context).dateOfActivityPerformedCanNotBeEmpty.showSnackbar(context);
    } else if (numberOfMemberInvolved == null) {
      S.of(context).pleaseSelectANumberOfMemberInvolvedInTheList
          .showSnackbar(context);
    } else if (levelOfActivity == null) {
      S.of(context).pleaseSelectALevelOfActivityInTheList.showSnackbar(context);
    } else if (chooseDoc == null) {
      S.of(context).pleaseChooseFile.showSnackbar(context);
    }
    else {
      S.of(context).formValidated.showToast();
      bool connected =
          await isConnectNetworkWithMessage(context, showToast: false);
      if (!connected) {
        AddConvenorActivityModel addConvenorActivityModel =
            AddConvenorActivityModel(
          selectedActivityType: addActivityProvider.selectActivityType,
          activityName: activityName,
          activityPerformedDate: selectedDate!.toIso8601String(),
          involvedMemberNumber: numberOfMemberInvolved,
          activityLevel: levelOfActivity,
          involvedMemberName: nameOfMembersInvolvedController.text.isEmpty
              ? ''
              : nameOfMembersInvolvedController.text,
          document: chooseDoc!.path,
        );
        await DBHelper.instance
            .addConvenorActivityTable(addConvenorActivityModel);
      } else {
        // TODO: integrate API for here
      }
      FocusScope.of(context).requestFocus(FocusNode());
      disposeProvider();
    }
  }

  void disposeProvider() {
    activityName = null;
    numberOfMemberInvolved = null;
    levelOfActivity = null;
    nameOfMembersInvolvedController.clear();
    selectedDate = null;
    chooseDoc = null;
    notifyListeners();
  }
}
