import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_validation.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/add_convenor_member_model.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/services/db_helper.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';

class AddMemberProvider extends DisposableProvider {
  String? selectedState;
  String? selectedCity;
  TextEditingController personNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  Future<void> validateForm(context) async {
    if (personNameController.text.isEmpty) {
      S.of(context).personNameCanNotBeEmpty.showSnackbar(context);
    } else if (contactController.text.isEmpty) {
      S.of(context).contactNumberCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.mobilePattern)
        .hasMatch(contactController.text.trim())) {
      S.of(context).contactNumberMustContainsAtLeast10Digits
          .showSnackbar(context);
    } else if (emailController.text.isEmpty) {
      S.of(context).emailCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.emailPattern)
        .hasMatch(emailController.text.trim())) {
      S.of(context).enterValidEmailAddress.showSnackbar(context);
    } else if (confirmEmailController.text.isEmpty) {
      S.of(context).confirmEmailCanNotBeEmpty.showSnackbar(context);
    } else if (emailController.text != confirmEmailController.text) {
      S.of(context).confirmEmailNotMatch.showSnackbar(context);
    } else if (selectedState == null) {
      S.of(context).pleaseSelectAStateInTheList.showSnackbar(context);
    } else if (selectedCity == null) {
      S.of(context).pleaseSelectACityInTheList.showSnackbar(context);
    } else {
      S.of(context).formValidated.showToast();
      bool connected =
          await isConnectNetworkWithMessage(context, showToast: false);
      if (!connected) {
        AddConvenorMemberModel addMemberModel = AddConvenorMemberModel(
          personName: personNameController.text,
          contactNumber: contactController.text,
          email: emailController.text,
          confirmEmail: confirmEmailController.text,
          state: selectedState,
          city: selectedCity,
        );
        await DBHelper.instance.addConvenorMemberTable(addMemberModel);
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
    // TODO: implement disposeAllValues
  }

  @override
  void disposeValues() {
    personNameController.clear();
    contactController.clear();
    emailController.clear();
    confirmEmailController.clear();
    selectedState = null;
    selectedCity = null;
    notifyListeners();
    // TODO: implement disposeValues
  }
}
