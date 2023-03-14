import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/resources_provider.dart';
import 'package:provider/provider.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ResourcesProvider>(
      builder: (BuildContext context, ResourcesProvider resourcesProvider, _) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppHeaderView(title: S.of(context).resources.toUpperCase()),
            ),
          ),
          body: resourcesProvider.pages[resourcesProvider.pageIndex],
          bottomNavigationBar: AppBottomNavigationBar(
            selectedIndex: resourcesProvider.pageIndex,
            bottomNavigationList: [
              BottomNavigationModel(
                title: S.of(context).fssaiResources,
                onPressed: () => resourcesProvider.goToResourcesPagesTab(0),
              ),
              BottomNavigationModel(
                title: S.of(context).netProFanResources,
                onPressed: () => resourcesProvider.goToResourcesPagesTab(1),
              ),
            ],
          ),
        );
      },
    );
  }
}
