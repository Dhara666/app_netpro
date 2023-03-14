// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Net pro fan`
  String get appTitle {
    return Intl.message(
      'Net pro fan',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Network Of\nProfessionals Of\nFood & Nutrition`
  String get networkOfProfessionalsOfFoodAndNutrition {
    return Intl.message(
      'Network Of\nProfessionals Of\nFood & Nutrition',
      name: 'networkOfProfessionalsOfFoodAndNutrition',
      desc: '',
      args: [],
    );
  }

  /// `NetProFan`
  String get netProFan {
    return Intl.message(
      'NetProFan',
      name: 'netProFan',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Associated Members`
  String get associatedMembers {
    return Intl.message(
      'Associated Members',
      name: 'associatedMembers',
      desc: '',
      args: [],
    );
  }

  /// `Want to become a member`
  String get wantToBecomeAMember {
    return Intl.message(
      'Want to become a member',
      name: 'wantToBecomeAMember',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `NetProFaN is envisaged as a platform, hosted by the\nFood Safety and Standards Authority of India (FSSAI),\nto leverage the collective strengths of the professional\nassociations and bodies in food and nutrition, to foster\ninnovations and enhance complementarity across\nthese bodies.\n`
  String get aboutDescription1 {
    return Intl.message(
      'NetProFaN is envisaged as a platform, hosted by the\nFood Safety and Standards Authority of India (FSSAI),\nto leverage the collective strengths of the professional\nassociations and bodies in food and nutrition, to foster\ninnovations and enhance complementarity across\nthese bodies.\n',
      name: 'aboutDescription1',
      desc: '',
      args: [],
    );
  }

  /// `In addition, this Network will leverage the resources, skills, expertise and knowledge of its members to support the national efforts in improving food and nutrition indicators.\n`
  String get aboutDescription2 {
    return Intl.message(
      'In addition, this Network will leverage the resources, skills, expertise and knowledge of its members to support the national efforts in improving food and nutrition indicators.\n',
      name: 'aboutDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Address Information`
  String get addressInformation {
    return Intl.message(
      'Address Information',
      name: 'addressInformation',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get callNow {
    return Intl.message(
      'Call Now',
      name: 'callNow',
      desc: '',
      args: [],
    );
  }

  /// `Mail`
  String get mail {
    return Intl.message(
      'Mail',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `New Member Registration`
  String get newMemberRegistration {
    return Intl.message(
      'New Member Registration',
      name: 'newMemberRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © Network of Professionals of Food and Nutrition 2018 FSSAI. All rights reserved.`
  String get footerDescription {
    return Intl.message(
      'Copyright © Network of Professionals of Food and Nutrition 2018 FSSAI. All rights reserved.',
      name: 'footerDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure, you want to exit?`
  String get areYouSureYouWantToExit {
    return Intl.message(
      'Are you sure, you want to exit?',
      name: 'areYouSureYouWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `Add Member`
  String get addMember {
    return Intl.message(
      'Add Member',
      name: 'addMember',
      desc: '',
      args: [],
    );
  }

  /// `Add Activity`
  String get addActivity {
    return Intl.message(
      'Add Activity',
      name: 'addActivity',
      desc: '',
      args: [],
    );
  }

  /// `Add Selected Activity`
  String get addSelectedActivity {
    return Intl.message(
      'Add Selected Activity',
      name: 'addSelectedActivity',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get proceed {
    return Intl.message(
      'Proceed',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `Pending Request`
  String get pendingRequest {
    return Intl.message(
      'Pending Request',
      name: 'pendingRequest',
      desc: '',
      args: [],
    );
  }

  /// `Chapter score`
  String get chapterScore {
    return Intl.message(
      'Chapter score',
      name: 'chapterScore',
      desc: '',
      args: [],
    );
  }

  /// `Chapter details`
  String get chapterDetails {
    return Intl.message(
      'Chapter details',
      name: 'chapterDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Your Activity Type`
  String get pleaseSelectYourActivityType {
    return Intl.message(
      'Please Select Your Activity Type',
      name: 'pleaseSelectYourActivityType',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get action {
    return Intl.message(
      'Action',
      name: 'action',
      desc: '',
      args: [],
    );
  }

  /// `Member List`
  String get memberList {
    return Intl.message(
      'Member List',
      name: 'memberList',
      desc: '',
      args: [],
    );
  }

  /// `Ambassador List`
  String get ambassadorList {
    return Intl.message(
      'Ambassador List',
      name: 'ambassadorList',
      desc: '',
      args: [],
    );
  }

  /// `Member Request`
  String get memberRequest {
    return Intl.message(
      'Member Request',
      name: 'memberRequest',
      desc: '',
      args: [],
    );
  }

  /// `Ambassador Request`
  String get ambassadorRequest {
    return Intl.message(
      'Ambassador Request',
      name: 'ambassadorRequest',
      desc: '',
      args: [],
    );
  }

  /// `Activity Request`
  String get activityList {
    return Intl.message(
      'Activity Request',
      name: 'activityList',
      desc: '',
      args: [],
    );
  }

  /// `Organizations : `
  String get organizations {
    return Intl.message(
      'Organizations : ',
      name: 'organizations',
      desc: '',
      args: [],
    );
  }

  /// `Professional Association :`
  String get professionalAssociation {
    return Intl.message(
      'Professional Association :',
      name: 'professionalAssociation',
      desc: '',
      args: [],
    );
  }

  /// `Association : `
  String get association {
    return Intl.message(
      'Association : ',
      name: 'association',
      desc: '',
      args: [],
    );
  }

  /// `Chapter name : `
  String get chapterName {
    return Intl.message(
      'Chapter name : ',
      name: 'chapterName',
      desc: '',
      args: [],
    );
  }

  /// `Contact : `
  String get contact {
    return Intl.message(
      'Contact : ',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Score : `
  String get score {
    return Intl.message(
      'Score : ',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `Content creation`
  String get contentCreation {
    return Intl.message(
      'Content creation',
      name: 'contentCreation',
      desc: '',
      args: [],
    );
  }

  /// `Training and capacity building`
  String get trainingAndCapacityBuilding {
    return Intl.message(
      'Training and capacity building',
      name: 'trainingAndCapacityBuilding',
      desc: '',
      args: [],
    );
  }

  /// `Mass dissemination`
  String get massDissemination {
    return Intl.message(
      'Mass dissemination',
      name: 'massDissemination',
      desc: '',
      args: [],
    );
  }

  /// `Outreach activity`
  String get outreachActivity {
    return Intl.message(
      'Outreach activity',
      name: 'outreachActivity',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter User Name`
  String get pleaseEnterUserName {
    return Intl.message(
      'Please Enter User Name',
      name: 'pleaseEnterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please Enter Password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Request Type*`
  String get requestType {
    return Intl.message(
      'Request Type*',
      name: 'requestType',
      desc: '',
      args: [],
    );
  }

  /// `[--Not Selected --]`
  String get notSelected {
    return Intl.message(
      '[--Not Selected --]',
      name: 'notSelected',
      desc: '',
      args: [],
    );
  }

  /// `Name of Member*`
  String get nameOfMember {
    return Intl.message(
      'Name of Member*',
      name: 'nameOfMember',
      desc: '',
      args: [],
    );
  }

  /// `Member Name`
  String get memberName {
    return Intl.message(
      'Member Name',
      name: 'memberName',
      desc: '',
      args: [],
    );
  }

  /// `Email*`
  String get email {
    return Intl.message(
      'Email*',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Member Email`
  String get memberEmail {
    return Intl.message(
      'Member Email',
      name: 'memberEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mobile*`
  String get mobile {
    return Intl.message(
      'Mobile*',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobileHint {
    return Intl.message(
      'Mobile',
      name: 'mobileHint',
      desc: '',
      args: [],
    );
  }

  /// `Organization*`
  String get organization {
    return Intl.message(
      'Organization*',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  /// `Organization Name`
  String get organizationName {
    return Intl.message(
      'Organization Name',
      name: 'organizationName',
      desc: '',
      args: [],
    );
  }

  /// `State*`
  String get state {
    return Intl.message(
      'State*',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `City*`
  String get city {
    return Intl.message(
      'City*',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Professional Association*`
  String get professionalAssociationLabel {
    return Intl.message(
      'Professional Association*',
      name: 'professionalAssociationLabel',
      desc: '',
      args: [],
    );
  }

  /// `Person Name*`
  String get personName {
    return Intl.message(
      'Person Name*',
      name: 'personName',
      desc: '',
      args: [],
    );
  }

  /// `Person Name`
  String get personNameHint {
    return Intl.message(
      'Person Name',
      name: 'personNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Contact*`
  String get contactLabel {
    return Intl.message(
      'Contact*',
      name: 'contactLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member Contact`
  String get memberContact {
    return Intl.message(
      'Member Contact',
      name: 'memberContact',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Email*`
  String get confirmEmailLabel {
    return Intl.message(
      'Confirm Email*',
      name: 'confirmEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Email`
  String get confirmEmail {
    return Intl.message(
      'Confirm Email',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Person name can't be empty`
  String get personNameCanNotBeEmpty {
    return Intl.message(
      'Person name can\'t be empty',
      name: 'personNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Only alphabet allow`
  String get onlyAlphabetAllow {
    return Intl.message(
      'Only alphabet allow',
      name: 'onlyAlphabetAllow',
      desc: '',
      args: [],
    );
  }

  /// `Contact number can't be empty`
  String get contactNumberCanNotBeEmpty {
    return Intl.message(
      'Contact number can\'t be empty',
      name: 'contactNumberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Contact number must contains at least 10 digits`
  String get contactNumberMustContainsAtLeast10Digits {
    return Intl.message(
      'Contact number must contains at least 10 digits',
      name: 'contactNumberMustContainsAtLeast10Digits',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get emailCanNotBeEmpty {
    return Intl.message(
      'Email can\'t be empty',
      name: 'emailCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid email address`
  String get enterValidEmailAddress {
    return Intl.message(
      'Enter valid email address',
      name: 'enterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Confirm email can't be empty`
  String get confirmEmailCanNotBeEmpty {
    return Intl.message(
      'Confirm email can\'t be empty',
      name: 'confirmEmailCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Confirm email not match`
  String get confirmEmailNotMatch {
    return Intl.message(
      'Confirm email not match',
      name: 'confirmEmailNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please select a state in the list`
  String get pleaseSelectAStateInTheList {
    return Intl.message(
      'Please select a state in the list',
      name: 'pleaseSelectAStateInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Please select a city in the list`
  String get pleaseSelectACityInTheList {
    return Intl.message(
      'Please select a city in the list',
      name: 'pleaseSelectACityInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Form validated`
  String get formValidated {
    return Intl.message(
      'Form validated',
      name: 'formValidated',
      desc: '',
      args: [],
    );
  }

  /// `User name can't be empty`
  String get userNameCanNotBeEmpty {
    return Intl.message(
      'User name can\'t be empty',
      name: 'userNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get passwordCanNotBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number can't be empty`
  String get mobileNumberCanNotBeEmpty {
    return Intl.message(
      'Mobile number can\'t be empty',
      name: 'mobileNumberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number must contains at least 10 digits`
  String get mobileNumberMustContainsAtLeast10Digits {
    return Intl.message(
      'Mobile number must contains at least 10 digits',
      name: 'mobileNumberMustContainsAtLeast10Digits',
      desc: '',
      args: [],
    );
  }

  /// `Member name can't be empty`
  String get memberNameCanNotBeEmpty {
    return Intl.message(
      'Member name can\'t be empty',
      name: 'memberNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Organization name can't be empty`
  String get organizationNameCanNotBeEmpty {
    return Intl.message(
      'Organization name can\'t be empty',
      name: 'organizationNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please select a request type in the list`
  String get pleaseSelectARequestTypeInTheList {
    return Intl.message(
      'Please select a request type in the list',
      name: 'pleaseSelectARequestTypeInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Please select professional association in the list`
  String get pleaseSelectAProfessionalAssociationInTheList {
    return Intl.message(
      'Please select professional association in the list',
      name: 'pleaseSelectAProfessionalAssociationInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Steering Committee`
  String get steeringCommittee {
    return Intl.message(
      'Steering Committee',
      name: 'steeringCommittee',
      desc: '',
      args: [],
    );
  }

  /// `NetProFan Chapters`
  String get netProFanChapters {
    return Intl.message(
      'NetProFan Chapters',
      name: 'netProFanChapters',
      desc: '',
      args: [],
    );
  }

  /// `Top Performers`
  String get topPerformers {
    return Intl.message(
      'Top Performers',
      name: 'topPerformers',
      desc: '',
      args: [],
    );
  }

  /// `Top 5 Chapters`
  String get top5Chapters {
    return Intl.message(
      'Top 5 Chapters',
      name: 'top5Chapters',
      desc: '',
      args: [],
    );
  }

  /// `Top 10 Members`
  String get top10Members {
    return Intl.message(
      'Top 10 Members',
      name: 'top10Members',
      desc: '',
      args: [],
    );
  }

  /// `City : `
  String get cityLabel {
    return Intl.message(
      'City : ',
      name: 'cityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please proceed with below form and submit`
  String get pleaseProceedWithBelowFormAndSubmit {
    return Intl.message(
      'Please proceed with below form and submit',
      name: 'pleaseProceedWithBelowFormAndSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Activity Name*`
  String get activityName {
    return Intl.message(
      'Activity Name*',
      name: 'activityName',
      desc: '',
      args: [],
    );
  }

  /// `Date of Activity Performed*`
  String get dateOfActivityPerformed {
    return Intl.message(
      'Date of Activity Performed*',
      name: 'dateOfActivityPerformed',
      desc: '',
      args: [],
    );
  }

  /// `Number of Member Involved*`
  String get numberOfMemberInvolved {
    return Intl.message(
      'Number of Member Involved*',
      name: 'numberOfMemberInvolved',
      desc: '',
      args: [],
    );
  }

  /// `Level of Activity*`
  String get levelOfActivity {
    return Intl.message(
      'Level of Activity*',
      name: 'levelOfActivity',
      desc: '',
      args: [],
    );
  }

  /// `Name of Member Involved`
  String get nameOfMemberInvolved {
    return Intl.message(
      'Name of Member Involved',
      name: 'nameOfMemberInvolved',
      desc: '',
      args: [],
    );
  }

  /// `Upload Supporting Documents*`
  String get uploadSupportingDocuments {
    return Intl.message(
      'Upload Supporting Documents*',
      name: 'uploadSupportingDocuments',
      desc: '',
      args: [],
    );
  }

  /// `Choose files`
  String get chooseFiles {
    return Intl.message(
      'Choose files',
      name: 'chooseFiles',
      desc: '',
      args: [],
    );
  }

  /// `No files choosen`
  String get noFilesChoosen {
    return Intl.message(
      'No files choosen',
      name: 'noFilesChoosen',
      desc: '',
      args: [],
    );
  }

  /// `Name of Member's Involved`
  String get nameOfMembersInvolved {
    return Intl.message(
      'Name of Member\'s Involved',
      name: 'nameOfMembersInvolved',
      desc: '',
      args: [],
    );
  }

  /// `Please select an activity name in the list`
  String get pleaseSelectAnActivityNameInTheList {
    return Intl.message(
      'Please select an activity name in the list',
      name: 'pleaseSelectAnActivityNameInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Please select a number of member involved in the list`
  String get pleaseSelectANumberOfMemberInvolvedInTheList {
    return Intl.message(
      'Please select a number of member involved in the list',
      name: 'pleaseSelectANumberOfMemberInvolvedInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Please select a level of activity in the list`
  String get pleaseSelectALevelOfActivityInTheList {
    return Intl.message(
      'Please select a level of activity in the list',
      name: 'pleaseSelectALevelOfActivityInTheList',
      desc: '',
      args: [],
    );
  }

  /// `Name of member can't be empty`
  String get nameOfMemberCanNotBeEmpty {
    return Intl.message(
      'Name of member can\'t be empty',
      name: 'nameOfMemberCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Please choose file`
  String get pleaseChooseFile {
    return Intl.message(
      'Please choose file',
      name: 'pleaseChooseFile',
      desc: '',
      args: [],
    );
  }

  /// `Date of activity performed can't be empty`
  String get dateOfActivityPerformedCanNotBeEmpty {
    return Intl.message(
      'Date of activity performed can\'t be empty',
      name: 'dateOfActivityPerformedCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `dd/mm/yyyy`
  String get ddMmYyyy {
    return Intl.message(
      'dd/mm/yyyy',
      name: 'ddMmYyyy',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Activity Performed`
  String get activityPerformed {
    return Intl.message(
      'Activity Performed',
      name: 'activityPerformed',
      desc: '',
      args: [],
    );
  }

  /// `Activity Category : `
  String get activityCategory {
    return Intl.message(
      'Activity Category : ',
      name: 'activityCategory',
      desc: '',
      args: [],
    );
  }

  /// `Activity Name : `
  String get activityNameMember {
    return Intl.message(
      'Activity Name : ',
      name: 'activityNameMember',
      desc: '',
      args: [],
    );
  }

  /// `Status : `
  String get status {
    return Intl.message(
      'Status : ',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Event Date : `
  String get eventDate {
    return Intl.message(
      'Event Date : ',
      name: 'eventDate',
      desc: '',
      args: [],
    );
  }

  /// `Organization : `
  String get organizationMember {
    return Intl.message(
      'Organization : ',
      name: 'organizationMember',
      desc: '',
      args: [],
    );
  }

  /// `Total Score : `
  String get totalScore {
    return Intl.message(
      'Total Score : ',
      name: 'totalScore',
      desc: '',
      args: [],
    );
  }

  /// `Member Dashboard`
  String get memberDashBoard {
    return Intl.message(
      'Member Dashboard',
      name: 'memberDashBoard',
      desc: '',
      args: [],
    );
  }

  /// `Convenor Dashboard`
  String get convenorDashBoard {
    return Intl.message(
      'Convenor Dashboard',
      name: 'convenorDashBoard',
      desc: '',
      args: [],
    );
  }

  /// `My chapters`
  String get myChapters {
    return Intl.message(
      'My chapters',
      name: 'myChapters',
      desc: '',
      args: [],
    );
  }

  /// `On going chapters`
  String get onGoingChapters {
    return Intl.message(
      'On going chapters',
      name: 'onGoingChapters',
      desc: '',
      args: [],
    );
  }

  /// `Add chapter`
  String get addChapter {
    return Intl.message(
      'Add chapter',
      name: 'addChapter',
      desc: '',
      args: [],
    );
  }

  /// `Association Of Food Scientist & Technologists (India)`
  String get associationOfFoodScientistAndTechnologistsIndia {
    return Intl.message(
      'Association Of Food Scientist & Technologists (India)',
      name: 'associationOfFoodScientistAndTechnologistsIndia',
      desc: '',
      args: [],
    );
  }

  /// `All chapters`
  String get allChapters {
    return Intl.message(
      'All chapters',
      name: 'allChapters',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Status :`
  String get chapterStatus {
    return Intl.message(
      'Chapter Status :',
      name: 'chapterStatus',
      desc: '',
      args: [],
    );
  }

  /// `Chapter State :`
  String get chapterState {
    return Intl.message(
      'Chapter State :',
      name: 'chapterState',
      desc: '',
      args: [],
    );
  }

  /// `Chapter City : `
  String get chapterCity {
    return Intl.message(
      'Chapter City : ',
      name: 'chapterCity',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Created By : `
  String get chapterCreatedBy {
    return Intl.message(
      'Chapter Created By : ',
      name: 'chapterCreatedBy',
      desc: '',
      args: [],
    );
  }

  /// `Your Participation Status : `
  String get yourParticipationStatus {
    return Intl.message(
      'Your Participation Status : ',
      name: 'yourParticipationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Name*`
  String get chapterNameLabel {
    return Intl.message(
      'Chapter Name*',
      name: 'chapterNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chapter Name`
  String get chapterNameHint {
    return Intl.message(
      'Chapter Name',
      name: 'chapterNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number*`
  String get contactNumber {
    return Intl.message(
      'Contact Number*',
      name: 'contactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contact Number`
  String get contactNumberHint {
    return Intl.message(
      'Contact Number',
      name: 'contactNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Organization Detail`
  String get organizationDetail {
    return Intl.message(
      'Organization Detail',
      name: 'organizationDetail',
      desc: '',
      args: [],
    );
  }

  /// `Organization Type`
  String get organizationType {
    return Intl.message(
      'Organization Type',
      name: 'organizationType',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get cityHint {
    return Intl.message(
      'City',
      name: 'cityHint',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Chapter name can't be empty`
  String get chapterNameCanNotBeEmpty {
    return Intl.message(
      'Chapter name can\'t be empty',
      name: 'chapterNameCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Organization type can't be empty`
  String get organizationTypeCanNotBeEmpty {
    return Intl.message(
      'Organization type can\'t be empty',
      name: 'organizationTypeCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Organization detail can't be empty`
  String get organizationDetailCanNotBeEmpty {
    return Intl.message(
      'Organization detail can\'t be empty',
      name: 'organizationDetailCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `2019`
  String get year2019 {
    return Intl.message(
      '2019',
      name: 'year2019',
      desc: '',
      args: [],
    );
  }

  /// `2020`
  String get year2020 {
    return Intl.message(
      '2020',
      name: 'year2020',
      desc: '',
      args: [],
    );
  }

  /// `2021`
  String get year2021 {
    return Intl.message(
      '2021',
      name: 'year2021',
      desc: '',
      args: [],
    );
  }

  /// `2022`
  String get year2022 {
    return Intl.message(
      '2022',
      name: 'year2022',
      desc: '',
      args: [],
    );
  }

  /// `Please select event year`
  String get pleaseSelectEventYear {
    return Intl.message(
      'Please select event year',
      name: 'pleaseSelectEventYear',
      desc: '',
      args: [],
    );
  }

  /// `FSSAI Resources`
  String get fssaiResources {
    return Intl.message(
      'FSSAI Resources',
      name: 'fssaiResources',
      desc: '',
      args: [],
    );
  }

  /// `NetProFaN Resources`
  String get netProFanResources {
    return Intl.message(
      'NetProFaN Resources',
      name: 'netProFanResources',
      desc: '',
      args: [],
    );
  }

  /// `Resources`
  String get resources {
    return Intl.message(
      'Resources',
      name: 'resources',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Poster`
  String get poster {
    return Intl.message(
      'Poster',
      name: 'poster',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Progress Details`
  String get progressDetails {
    return Intl.message(
      'Progress Details',
      name: 'progressDetails',
      desc: '',
      args: [],
    );
  }

  /// `Selected Activity : `
  String get selectedActivity {
    return Intl.message(
      'Selected Activity : ',
      name: 'selectedActivity',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Your Activity Category`
  String get pleaseSelectYourActivityCategory {
    return Intl.message(
      'Please Select Your Activity Category',
      name: 'pleaseSelectYourActivityCategory',
      desc: '',
      args: [],
    );
  }

  /// `Activity Performed :`
  String get activityPerformedHeader {
    return Intl.message(
      'Activity Performed :',
      name: 'activityPerformedHeader',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contactHeader {
    return Intl.message(
      'Contact',
      name: 'contactHeader',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Direction`
  String get direction {
    return Intl.message(
      'Direction',
      name: 'direction',
      desc: '',
      args: [],
    );
  }

  /// `Message can't be empty`
  String get messageCanNotBeEmpty {
    return Intl.message(
      'Message can\'t be empty',
      name: 'messageCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `WHY NetProFaN`
  String get whyNetProFan {
    return Intl.message(
      'WHY NetProFaN',
      name: 'whyNetProFan',
      desc: '',
      args: [],
    );
  }

  /// `objective`
  String get objective {
    return Intl.message(
      'objective',
      name: 'objective',
      desc: '',
      args: [],
    );
  }

  /// `themes`
  String get themes {
    return Intl.message(
      'themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `rewards`
  String get rewards {
    return Intl.message(
      'rewards',
      name: 'rewards',
      desc: '',
      args: [],
    );
  }

  /// `pledges`
  String get pledges {
    return Intl.message(
      'pledges',
      name: 'pledges',
      desc: '',
      args: [],
    );
  }

  /// `Structure`
  String get structure {
    return Intl.message(
      'Structure',
      name: 'structure',
      desc: '',
      args: [],
    );
  }

  /// `Themes in Action`
  String get themesInAction {
    return Intl.message(
      'Themes in Action',
      name: 'themesInAction',
      desc: '',
      args: [],
    );
  }

  /// `Chapters`
  String get chapters {
    return Intl.message(
      'Chapters',
      name: 'chapters',
      desc: '',
      args: [],
    );
  }

  /// `Message*`
  String get messageHint {
    return Intl.message(
      'Message*',
      name: 'messageHint',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `No on going chapters available`
  String get noOnGoingChaptersAvailable {
    return Intl.message(
      'No on going chapters available',
      name: 'noOnGoingChaptersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No chapters available`
  String get noChaptersAvailable {
    return Intl.message(
      'No chapters available',
      name: 'noChaptersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Chapter`
  String get chapter {
    return Intl.message(
      'Chapter',
      name: 'chapter',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get member {
    return Intl.message(
      'Member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `View Members`
  String get viewMember {
    return Intl.message(
      'View Members',
      name: 'viewMember',
      desc: '',
      args: [],
    );
  }

  /// `Member Name*`
  String get memberNameLabel {
    return Intl.message(
      'Member Name*',
      name: 'memberNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member City*`
  String get memberCityLabel {
    return Intl.message(
      'Member City*',
      name: 'memberCityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member Email*`
  String get memberEmailLabel {
    return Intl.message(
      'Member Email*',
      name: 'memberEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member State*`
  String get memberStateLabel {
    return Intl.message(
      'Member State*',
      name: 'memberStateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member Contact Number*`
  String get memberContactNumberLabel {
    return Intl.message(
      'Member Contact Number*',
      name: 'memberContactNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Member Contact Number`
  String get memberContactNumber {
    return Intl.message(
      'Member Contact Number',
      name: 'memberContactNumber',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Reason why you got removed?`
  String get chapterRemoveReason {
    return Intl.message(
      'Reason why you got removed?',
      name: 'chapterRemoveReason',
      desc: '',
      args: [],
    );
  }

  /// `Have you got removed from this chapter?`
  String get alertChapterRemove {
    return Intl.message(
      'Have you got removed from this chapter?',
      name: 'alertChapterRemove',
      desc: '',
      args: [],
    );
  }

  /// `Participate`
  String get participate {
    return Intl.message(
      'Participate',
      name: 'participate',
      desc: '',
      args: [],
    );
  }

  /// `No members available`
  String get noMembersAvailable {
    return Intl.message(
      'No members available',
      name: 'noMembersAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Member State : `
  String get memberState {
    return Intl.message(
      'Member State : ',
      name: 'memberState',
      desc: '',
      args: [],
    );
  }

  /// `Member City : `
  String get memberCity {
    return Intl.message(
      'Member City : ',
      name: 'memberCity',
      desc: '',
      args: [],
    );
  }

  /// `Contact No : `
  String get contactNo {
    return Intl.message(
      'Contact No : ',
      name: 'contactNo',
      desc: '',
      args: [],
    );
  }

  /// `Registered By : `
  String get registeredBy {
    return Intl.message(
      'Registered By : ',
      name: 'registeredBy',
      desc: '',
      args: [],
    );
  }

  /// `Participation Status : `
  String get participationStatus {
    return Intl.message(
      'Participation Status : ',
      name: 'participationStatus',
      desc: '',
      args: [],
    );
  }

  /// `Member Status :`
  String get memberStatus {
    return Intl.message(
      'Member Status :',
      name: 'memberStatus',
      desc: '',
      args: [],
    );
  }

  /// `Is Active : `
  String get isActive {
    return Intl.message(
      'Is Active : ',
      name: 'isActive',
      desc: '',
      args: [],
    );
  }

  /// `Is Member? : `
  String get isMember {
    return Intl.message(
      'Is Member? : ',
      name: 'isMember',
      desc: '',
      args: [],
    );
  }

  /// `Is Convener? : `
  String get isConvener {
    return Intl.message(
      'Is Convener? : ',
      name: 'isConvener',
      desc: '',
      args: [],
    );
  }

  /// `Is Co-Convener? : `
  String get isCoConvener {
    return Intl.message(
      'Is Co-Convener? : ',
      name: 'isCoConvener',
      desc: '',
      args: [],
    );
  }

  /// `Email : `
  String get emailLabel {
    return Intl.message(
      'Email : ',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email address already in use. It must be unique`
  String get uniqueEmailError {
    return Intl.message(
      'Email address already in use. It must be unique',
      name: 'uniqueEmailError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
