import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/utills/app_validation.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/add_association_chapter_model.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/services/db_helper.dart';

class AssociationAddChapterProvider extends DisposableProvider {
  String? selectedState;
  String? selectedCity;
  TextEditingController chapterNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController organizationTypeController = TextEditingController();
  TextEditingController organizationDetailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  Future<void> validateForm(context) async {
    if (chapterNameController.text.isEmpty) {
      S.of(context).chapterNameCanNotBeEmpty.showSnackbar(context);
    } else if (contactNumberController.text.isEmpty) {
      S.of(context).contactNumberCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.mobilePattern)
        .hasMatch(contactNumberController.text.trim())) {
      S.of(context).mobileNumberMustContainsAtLeast10Digits
          .showSnackbar(context);
    } else if (emailController.text.isEmpty) {
      S.of(context).emailCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.emailPattern)
        .hasMatch(emailController.text.trim())) {
      S.of(context).enterValidEmailAddress.showSnackbar(context);
    } else if (organizationTypeController.text.isEmpty) {
      S.of(context).organizationTypeCanNotBeEmpty.showSnackbar(context);
    } else if (organizationDetailController.text.isEmpty) {
      S.of(context).organizationDetailCanNotBeEmpty.showSnackbar(context);
    } else if (selectedState == null) {
      S.of(context).pleaseSelectAStateInTheList.showSnackbar(context);
    } else if (selectedCity == null) {
      S.of(context).pleaseSelectACityInTheList.showSnackbar(context);
    } else {
      S.of(context).formValidated.showToast();
      bool connected =
          await isConnectNetworkWithMessage(context, showToast: false);
      if (!connected) {
        AddAssociationChapterModel addAssociationChapterModel =
            AddAssociationChapterModel(
          chapterName: chapterNameController.text,
          contactNumber: contactNumberController.text,
          email: emailController.text,
          organizationType: organizationTypeController.text,
          organizationDetail: organizationDetailController.text,
          state: selectedState,
          city: selectedCity,
        );
        await DBHelper.instance
            .addAssociationChapterTable(addAssociationChapterModel);
      } else {
        // TODO: integrate API for here
      }
      FocusScope.of(context).requestFocus(FocusNode());
      disposeValues();
    }
  }

  void stateOnChanged(BuildContext context,String? request,LocalDataProvider localDataProvider) {
    selectedState = request;
    selectedCity = null;
    localDataProvider.cityList.clear();
    for (List<String> element in localDataProvider.statesList) {
      if (element.last == request) {
        localDataProvider.getCity(context, element.first);
      }
    }
    notifyListeners();
  }
  void cityOnChanged(String? request) {
    selectedCity = request;
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    disposeValues();
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    chapterNameController.clear();
    contactNumberController.clear();
    emailController.clear();
    organizationTypeController.clear();
    organizationDetailController.clear();
    selectedState = null;
    selectedCity = null;
    notifyListeners();
    // TODO: implement disposeValues
  }
}
