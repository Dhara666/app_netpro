import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:net_pro_fan/app/widget/app_appbar.dart';
import 'package:net_pro_fan/app/widget/app_drawer.dart';
import 'package:net_pro_fan/providers/dashboard_provider.dart';
import 'package:net_pro_fan/providers/remote_config_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<DashBoardProvider>(context, listen: false).uploadDataToServer();
    Provider.of<RemoteConfigProvider>(context, listen: false)
        .getRemoteConfigValue(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(
      builder: (BuildContext context, DashBoardProvider dashboardProvider, _) {
        return WillPopScope(
          onWillPop: () async {
            dashboardProvider.advancedDrawerController.hideDrawer();
            return dashboardProvider.onWillPop(context);
          },
          child: AdvancedDrawer(
            drawer: const AppDrawer(),
            controller: dashboardProvider.advancedDrawerController,
            child: Scaffold(
              appBar: AppAppBar(
                showUser: true,
                isHome: false,
                onUserTap: () => dashboardProvider.advancedDrawerController.showDrawer()
              ),
              body: dashboardProvider
                  .dashboardList[dashboardProvider.selectedIndex],
            ),
          ),
        );
      },
    );
  }
}
