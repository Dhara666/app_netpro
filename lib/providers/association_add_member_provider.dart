import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/app/utills/app_validation.dart';
import 'package:net_pro_fan/app/widget/app_toast.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/add_association_chapter_model.dart';
import 'package:net_pro_fan/providers/association_member_provider.dart';
import 'package:net_pro_fan/providers/disposable_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/services/db_helper.dart';
import 'package:net_pro_fan/services/rest_service.dart';
import 'package:provider/provider.dart';

class AssociationAddMemberProvider extends DisposableProvider {
  String? selectedState;
  String? selectedCity;
  TextEditingController memberNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();

  Future<void> validateForm(context) async {
    if (memberNameController.text.isEmpty) {
      S.of(context).memberNameCanNotBeEmpty.showSnackbar(context);
    } else if (contactNumberController.text.isEmpty) {
      S.of(context).contactNumberCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.mobilePattern).hasMatch(contactNumberController.text.trim())) {
      S.of(context).mobileNumberMustContainsAtLeast10Digits.showSnackbar(context);
    } else if (emailController.text.isEmpty) {
      S.of(context).emailCanNotBeEmpty.showSnackbar(context);
    } else if (!RegExp(AppValidation.emailPattern).hasMatch(emailController.text.trim())) {
      S.of(context).enterValidEmailAddress.showSnackbar(context);
    } else if (selectedState == null) {
      S.of(context).pleaseSelectAStateInTheList.showSnackbar(context);
    } else if (selectedCity == null) {
      S.of(context).pleaseSelectACityInTheList.showSnackbar(context);
    } else {
      bool connected = await isConnectNetworkWithMessage(context, showToast: false);
      if (!connected) {
        AddAssociationChapterModel addAssociationChapterModel = AddAssociationChapterModel(
          chapterName: memberNameController.text,
          contactNumber: contactNumberController.text,
          email: emailController.text,
          state: selectedState,
          city: selectedCity,
        );
        await DBHelper.instance.addAssociationChapterTable(addAssociationChapterModel);
        FocusScope.of(context).requestFocus(FocusNode());
        disposeValues();
      } else {
        addAssociationMember(context);
      }
    }
  }

  Future<bool> checkUniqueEmail(context) async {
    try {
      Map<String, String> body = {
        "userEmail": emailController.text,
      };
      String? checkUniqueEmail = await RestServices.multiPartRestCall(context, endpoint: RestConstants.checkUniqueEmailEndPoint, body: body);
      if (checkUniqueEmail != null && checkUniqueEmail.isNotEmpty) {
        return jsonDecode(checkUniqueEmail);
      }
      return false;
    } on SocketException catch (e) {
      logs('Socket exception in validate email --> ${e.message}');
      e.message.showToast(isError: true);
      return false;
    }
  }

  Future<void> addAssociationMember(context) async {
    try {
      bool isUniqueEmail = await checkUniqueEmail(context);
      if (isUniqueEmail) {
        S.of(context).uniqueEmailError.showToast(isError: true);
        return;
      }
      Map<String, String> body = {
        "memberName": memberNameController.text,
        "memberContactNum": contactNumberController.text,
        "memberEmail": emailController.text,
        "memberState": selectedState!,
        "memberCityName": selectedCity!
      };
      logs('body --> $body');
      String? addAssoiciationMember = await RestServices.multiPartRestCall(context, endpoint: RestConstants.associationAddMemberEndPoint, body: body);
      if (addAssoiciationMember != null && addAssoiciationMember.isNotEmpty) {
        Map<String, dynamic> addMember = jsonDecode(addAssoiciationMember);
        if (addMember.isNotEmpty && addMember.containsKey('responseMessage')) {
          addMember['responseMessage'].toString().showToast();
          FocusScope.of(context).requestFocus(FocusNode());
          disposeValues();
          AssociationMemberProvider associationMemberProvider = Provider.of<AssociationMemberProvider>(context, listen: false);
          associationMemberProvider.goToAssociationMemberPageTab(1);
        }
      }
    } on SocketException catch (e) {
      logs('Socket exception in authenticate user --> ${e.message}');
      e.message.showToast(isError: true);
    }
  }

  void stateOnChanged(BuildContext context, String? request, LocalDataProvider localDataProvider) {
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
    memberNameController.clear();
    contactNumberController.clear();
    emailController.clear();
    selectedState = null;
    selectedCity = null;
    notifyListeners();
    // TODO: implement disposeValues
  }
}
