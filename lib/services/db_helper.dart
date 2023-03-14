// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:net_pro_fan/app/utills/app_logs.dart';
import 'package:net_pro_fan/model/add_association_chapter_model.dart';
import 'package:net_pro_fan/model/add_convenor_activity_model.dart';
import 'package:net_pro_fan/model/add_convenor_member_model.dart';
import 'package:net_pro_fan/model/add_member_activity_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? _db;

  DBHelper._instance();

  static const String dbName = 'NetProFanDatabase';

  //     ======================= Add Convenor Member Data Table =======================     //
  static const String cAddMemberTable = 'cAddMemberTable';
  static const String cAddMemberId = 'addMemberId';
  static const String cAddMemberTableStatus = 'addMemberTableStatus';
  static const String cPersonName = 'personName';
  static const String cContactNumber = 'contactNumber';
  static const String cEmail = 'email';
  static const String cConfirmEmail = 'confirmEmail';
  static const String cState = 'state';
  static const String cCity = 'city';

  //     ======================= Add Convenor Activity Data Table =======================     //
  static const String cAddActivityTable = 'cAddActivityTable';
  static const String cAddActivityId = 'addActivityId';
  static const String cAddActivityTableStatus = 'addActivityTableStatus';
  static const String cSelectedActivityType = 'selectedActivityType';
  static const String cActivityName = 'activityName';
  static const String cActivityPerformedDate = 'activityPerformedDate';
  static const String cInvolvedMemberNumber = 'involvedMemberNumber';
  static const String cActivityLevel = 'activityLevel';
  static const String cInvolvedMemberName = 'involvedMemberName';
  static const String cDocument = 'document';

  //     ======================= Add Member Activity Data Table =======================     //
  static const String mAddActivityTable = 'mAddActivityTable';
  static const String mAddActivityId = 'addActivityId';
  static const String mAddActivityTableStatus = 'addActivityTableStatus';
  static const String mSelectedActivityType = 'selectedActivityType';
  static const String mActivityName = 'activityName';
  static const String mActivityPerformedDate = 'activityPerformedDate';
  static const String mActivityLevel = 'activityLevel';
  static const String mDocument = 'document';

  //     ======================= Add Association Chapter Data Table =======================     //
  static const String aAddChapterTable = 'aAddChapterTable';
  static const String aAddChapterId = 'addChapterId';
  static const String aAddChapterTableStatus = 'addChapterTableStatus';
  static const String aChapterName = 'chapterName';
  static const String aContactNumber = 'contactNumber';
  static const String aEmail = 'email';
  static const String aOrganizationType = 'organizationType';
  static const String aOrganizationDetail = 'organizationDetail';
  static const String aState = 'state';
  static const String aCity = 'city';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    } else {
      logs('Database Name : $_db');
      logs('Database Check : ${_db!.isOpen}');
    }
    return _db;
  }

  _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $cAddMemberTable ($cAddMemberId integer primary key autoincrement, $cAddMemberTableStatus TEXT,$cPersonName TEXT, $cContactNumber TEXT,$cEmail TEXT, $cConfirmEmail TEXT, $cState TEXT, $cCity TEXT)');
    await db.execute(
        'CREATE TABLE $cAddActivityTable ($cAddActivityId integer primary key autoincrement, $cAddActivityTableStatus TEXT,$cSelectedActivityType TEXT, $cActivityName TEXT,$cActivityPerformedDate TEXT, $cInvolvedMemberNumber TEXT, $cActivityLevel TEXT, $cInvolvedMemberName TEXT, $cDocument TEXT)');
    await db.execute(
        'CREATE TABLE $mAddActivityTable ($mAddActivityId integer primary key autoincrement, $mAddActivityTableStatus TEXT,$mSelectedActivityType TEXT, $mActivityName TEXT,$mActivityPerformedDate TEXT, $mActivityLevel TEXT, $mDocument TEXT)');
    await db.execute(
        'CREATE TABLE $aAddChapterTable ($aAddChapterId integer primary key autoincrement, $aAddChapterTableStatus TEXT,$aChapterName TEXT, $aContactNumber TEXT,$aEmail TEXT, $aOrganizationType TEXT, $aOrganizationDetail TEXT, $aState TEXT, $aCity TEXT)');
  }

  //     ======================= Add Member Data Table Method =======================     //
  Future<int> addConvenorMemberTable(AddConvenorMemberModel addMemberModel) async {
    Database? dbClient = await db;
    final int result =
        await dbClient!.insert(cAddMemberTable, addMemberModel.toJson());
    logs('Add convenor member result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getConvenorMemberTable() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result =
        await dbClient!.query(cAddMemberTable);
    logs('Get convenor member result : $result');
    return result;
  }

  Future updateConvenorMemberTable(int id, String memberStatus) async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
        'UPDATE $cAddMemberTable SET $cAddMemberTableStatus = ? WHERE $cAddMemberId = ?',
        [memberStatus, id]);
    logs('Update convenor member result : $result');
    return result;
  }

  //     ======================= Add Convenor Activity Data Table Method =======================     //
  Future<int> addConvenorActivityTable(
      AddConvenorActivityModel addConvenorActivityModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!
        .insert(cAddActivityTable, addConvenorActivityModel.toJson());
    logs('Add convenor activity result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getConvenorActivityTable() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result =
        await dbClient!.query(cAddActivityTable);
    logs('Get convenor activity result : $result');
    return result;
  }

  Future updateConvenorActivityTable(int id, String addActivityStatus) async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
        'UPDATE $cAddActivityTable SET $cAddActivityTableStatus = ? WHERE $cAddActivityId = ?',
        [addActivityStatus, id]);
    logs('Update convenor activity result : $result');
    return result;
  }

  //     ======================= Add Member Activity Data Table Method =======================     //
  Future<int> addMemberActivityTable(
      AddMemberActivityModel addMemberActivityModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!
        .insert(mAddActivityTable, addMemberActivityModel.toJson());
    logs('Add member activity result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getMemberActivityTable() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result =
        await dbClient!.query(mAddActivityTable);
    logs('Get member activity result : $result');
    return result;
  }

  Future updateMemberActivityTable(int id, String addActivityStatus) async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
        'UPDATE $mAddActivityTable SET $mAddActivityTableStatus = ? WHERE $mAddActivityId = ?',
        [addActivityStatus, id]);
    logs('Update member activity result : $result');
    return result;
  }

  //     ======================= Add Association Chapter Data Table Method =======================     //
  Future<int> addAssociationChapterTable(
      AddAssociationChapterModel addAssociationChapterModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!
        .insert(aAddChapterTable, addAssociationChapterModel.toJson());
    logs('Add association chapter result : $result');
    return result;
  }

  Future<List<Map<String, dynamic>>> getAssociationChapterTable() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result =
        await dbClient!.query(aAddChapterTable);
    logs('Get association chapter result : $result');
    return result;
  }

  Future updateAssociationChapterTable(int id, String addChapterStatus) async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.rawQuery(
        'UPDATE $aAddChapterTable SET $aAddChapterTableStatus = ? WHERE $aAddChapterId = ?',
        [addChapterStatus, id]);
    logs('Update association chapter result : $result');
    return result;
  }

  //     ======================= Delete Database =======================     //
  Future<void> deleteDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    return databaseFactory.deleteDatabase(path);
  }
}
