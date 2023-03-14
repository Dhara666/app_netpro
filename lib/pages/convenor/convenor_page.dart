import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_bottom_navigation_bar.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/model/bottom_navigation_model.dart';
import 'package:net_pro_fan/pages/convenor/widgets/convenor_floating_action_button.dart';
import 'package:net_pro_fan/providers/convenor_provider.dart';
import 'package:provider/provider.dart';

class ConvenorPage extends StatelessWidget {
  const ConvenorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConvenorProvider>(
      builder: (BuildContext context, ConvenorProvider convenorProvider, _) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppHeaderView(title: S.of(context).convenorDashBoard),
            ),
          ),
          body: convenorProvider.pages[convenorProvider.pageIndex],
          floatingActionButton: const ConvenorFloatingActionButton(),
          bottomNavigationBar: AppBottomNavigationBar(
            selectedIndex: convenorProvider.pageIndex,
            bottomNavigationList: [
              BottomNavigationModel(
                title: S.of(context).pendingRequest.toUpperCase(),
                onPressed: () =>convenorProvider.goToConvenorPagesTab(0),
              ),
              BottomNavigationModel(
                title: S.of(context).chapterScore.toUpperCase(),
                onPressed: () =>convenorProvider.goToConvenorPagesTab(1),
              ),
              BottomNavigationModel(
                title: S.of(context).chapterDetails.toUpperCase(),
                onPressed: () =>convenorProvider.goToConvenorPagesTab(2),
              ),
            ],
          ),
        );
      },
    );
  }
}
