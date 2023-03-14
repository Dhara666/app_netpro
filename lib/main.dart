import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/about_us_provider.dart';
import 'package:net_pro_fan/providers/add_activity_provider.dart';
import 'package:net_pro_fan/providers/add_member_provider.dart';
import 'package:net_pro_fan/providers/association_add_chapter_provider.dart';
import 'package:net_pro_fan/providers/association_add_member_provider.dart';
import 'package:net_pro_fan/providers/association_provider.dart';
import 'package:net_pro_fan/providers/chapter_activity_provider.dart';
import 'package:net_pro_fan/providers/contact_us_provider.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/providers/events_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:net_pro_fan/providers/login_provider.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/chapter_details_provider.dart';
import 'package:net_pro_fan/providers/convenor_provider.dart';
import 'package:net_pro_fan/providers/member_add_activity_provider.dart';
import 'package:net_pro_fan/providers/member_provider.dart';
import 'package:net_pro_fan/providers/member_selected_activity_type_provider.dart';
import 'package:net_pro_fan/providers/pending_request_provider.dart';
import 'package:net_pro_fan/providers/register_provider.dart';
import 'package:net_pro_fan/providers/public_members_provider.dart';
import 'package:net_pro_fan/providers/remote_config_provider.dart';
import 'package:net_pro_fan/providers/net_pro_fan_resources_provider.dart';
import 'package:net_pro_fan/providers/fssai_resources_provider.dart';
import 'package:net_pro_fan/providers/resources_provider.dart';
import 'package:net_pro_fan/providers/selected_activity_type_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:net_pro_fan/providers/top_performers_provider.dart';
import 'package:net_pro_fan/services/remote_config_service.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/dashboard/dashboard_page.dart';
import 'package:provider/provider.dart';
import 'providers/association_member_provider.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await RemoteConfigService.setupRemoteConfig();
    runApp(
      ChangeNotifierProvider<ThemeProvider>(
        create: (BuildContext context) => ThemeProvider(),
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver firebaseAnalyticsObserver =
      FirebaseAnalyticsObserver(analytics: firebaseAnalytics);
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<DashBoardProvider>(
        create: (context) => DashBoardProvider()),
    ChangeNotifierProvider<RegisterProvider>(
        create: (context) => RegisterProvider()),
    ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
    ChangeNotifierProvider<AddMemberProvider>(
        create: (context) => AddMemberProvider()),
    ChangeNotifierProvider<AddActivityProvider>(
        create: (context) => AddActivityProvider()),
    ChangeNotifierProvider<ConvenorProvider>(
        create: (context) => ConvenorProvider()),
    ChangeNotifierProvider<PendingRequestProvider>(
        create: (context) => PendingRequestProvider()),
    ChangeNotifierProvider<ChapterDetailsProvider>(
        create: (context) => ChapterDetailsProvider()),
    ChangeNotifierProvider<PublicMemberProvider>(
        create: (context) => PublicMemberProvider()),
    ChangeNotifierProvider<TopPerFormersProvider>(
        create: (context) => TopPerFormersProvider()),
    ChangeNotifierProvider<SelectedActivityTypeProvider>(
        create: (context) => SelectedActivityTypeProvider()),
    ChangeNotifierProvider<MembersProvider>(
        create: (context) => MembersProvider()),
    ChangeNotifierProvider<MemberAddActivityProvider>(
        create: (context) => MemberAddActivityProvider()),
    ChangeNotifierProvider<MemberSelectedActivityTypeProvider>(
        create: (context) => MemberSelectedActivityTypeProvider()),
    ChangeNotifierProvider<RemoteConfigProvider>(
        create: (context) => RemoteConfigProvider()),
    ChangeNotifierProvider<AssociationProvider>(
        create: (context) => AssociationProvider()),
    ChangeNotifierProvider<AssociationAddChapterProvider>(
        create: (context) => AssociationAddChapterProvider()),
    ChangeNotifierProvider<EventsProvider>(
        create: (context) => EventsProvider()),
    ChangeNotifierProvider<FssaiResourcesProvider>(
        create: (context) => FssaiResourcesProvider()),
    ChangeNotifierProvider<NetProFanResourcesProvider>(
        create: (context) => NetProFanResourcesProvider()),
    ChangeNotifierProvider<ResourcesProvider>(
        create: (context) => ResourcesProvider()),
    ChangeNotifierProvider<ChapterActivityProvider>(
        create: (context) => ChapterActivityProvider()),
    ChangeNotifierProvider<ContactUsProvider>(
        create: (context) => ContactUsProvider()),
    ChangeNotifierProvider<AboutUsProvider>(
        create: (context) => AboutUsProvider()),
    ChangeNotifierProvider<LocalDataProvider>(
        create: (context) => LocalDataProvider()),
    ChangeNotifierProvider<AssociationChapterProvider>(
        create: (context) => AssociationChapterProvider()),
    ChangeNotifierProvider<AssociationMemberProvider>(
        create: (context) => AssociationMemberProvider()),
    ChangeNotifierProvider<AssociationAddMemberProvider>(
        create: (context) => AssociationAddMemberProvider()),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider themeProvider, _) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: themeProvider.isDarkMode
                  ? ColorConstant.appDarkBlack
                  : ColorConstant.appWhite,
              statusBarIconBrightness:
                  themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
            ),
          );
          return MaterialApp(
            title: 'Net pro fan',
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyBehavior(),
            builder: BotToastInit(),
            navigatorObservers: <NavigatorObserver>[firebaseAnalyticsObserver,BotToastNavigatorObserver()],
            theme: themeProvider.selectedThemeData,
            darkTheme: themeProvider.darkTheme,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const DashboardPage(),
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
