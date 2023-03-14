import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_validation.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';

class RegisterProvider extends DisposableProvider {
  String? selectedRequestType;
  String? selectedState;
  String? selectedCity;
  String? selectedProfession;
  TextEditingController memberNameController = TextEditingController();
  TextEditingController organizationNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  List<String> requestList = ['Member', 'Ambassador'];
  List<String> professionList = [
    'Association1',
    'Association2',
    'Association3'
  ];

  void validateForm(context) {
    if (selectedRequestType == null) {
      S.of(context).pleaseSelectARequestTypeInTheList.showSnackbar(context);
    } else if (memberNameController.text.isEmpty) {
      S.of(context).memberNameCanNotBeEmpty.showSnackbar(context);
    } else if (emailController.text.isEmpty) {
      S.of(context).emailCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.emailPattern)
        .hasMatch(emailController.text.trim())) {
      S.of(context).enterValidEmailAddress.showSnackbar(context);
    } else if (mobileController.text.isEmpty) {
      S.of(context).mobileNumberCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.mobilePattern)
        .hasMatch(mobileController.text.trim())) {
      S.of(context).mobileNumberMustContainsAtLeast10Digits
          .showSnackbar(context);
    } else if (organizationNameController.text.isEmpty) {
      S.of(context).organizationNameCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.namePattern)
        .hasMatch(organizationNameController.text.trim())) {
      S.of(context).onlyAlphabetAllow.showSnackbar(context);
    } else if (selectedState == null) {
      S.of(context).pleaseSelectAStateInTheList.showSnackbar(context);
    } else if (selectedCity == null) {
      S.of(context).pleaseSelectACityInTheList.showSnackbar(context);
    } else if (selectedRequestType == requestList[0] &&
        selectedProfession == null) {
      S.of(context).pleaseSelectAProfessionalAssociationInTheList
          .showSnackbar(context);
    } else {
      S.of(context).formValidated.showToast();
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

  void requestTypeOnChanged(String? request) {
    selectedRequestType = request;
    notifyListeners();
  }

  void professionOnChanged(String? request) {
    selectedProfession = request;
    notifyListeners();
  }

  @override
  void disposeAllValues() {
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    selectedRequestType = null;
    memberNameController.clear();
    emailController.clear();
    mobileController.clear();
    organizationNameController.clear();
    selectedState = null;
    selectedCity = null;
    selectedRequestType = null;
    selectedProfession = null;
    notifyListeners();
    // TODO: implement disposeValues
  }
}
