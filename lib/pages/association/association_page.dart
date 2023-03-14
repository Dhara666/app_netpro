import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/providers/association_provider.dart';
import 'package:provider/provider.dart';

class AssociationPage extends StatelessWidget {
  const AssociationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationProvider>(
      builder:
          (BuildContext context, AssociationProvider associationProvider, _) {
        return Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 0,
          //   bottom: PreferredSize(
          //     preferredSize: const Size.fromHeight(50.0),
          //     child: AppHeaderView(title: S.of(context).associationOfFoodScientistAndTechnologistsIndia.toUpperCase()),
          //   ),
          // ),
          body: associationProvider.pages[associationProvider.pageIndex],
          bottomNavigationBar: AppBottomNavigationBar(
            selectedIndex: associationProvider.pageIndex,
            bottomNavigationList: [
              BottomNavigationModel(
                title: S.of(context).chapter.toUpperCase(),
                onPressed: () => associationProvider.goToAssociationPageTab(context,0),
              ),
              BottomNavigationModel(
                title: S.of(context).member.toUpperCase(),
                onPressed: () => associationProvider.goToAssociationPageTab(context,1),
              ),
            ],
          ),
        );
      },
    );
  }
}
