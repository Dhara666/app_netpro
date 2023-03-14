import 'package:flutter/material.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/pages/public_members/widgets/top_performers_card_view.dart';
import 'package:net_pro_fan/pages/public_members/widgets/top_performers_tab_bar_view.dart';
import 'package:net_pro_fan/providers/top_performers_provider.dart';
import 'package:provider/provider.dart';

class TopPerformersPage extends StatelessWidget {
  const TopPerformersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TopPerFormersProvider>(
      builder: (BuildContext context,
          TopPerFormersProvider topPerFormersProvider, _) {
        return Scaffold(
          appBar: TopPerformersTabBarView(),
          body: ListView.builder(
            itemCount: topPerFormersProvider.pageIndex == 0
                ? AppList.topChaptersList.length
                : AppList.topMembersList.length,
            itemBuilder: (context, index) => TopPerformersCardView(
              isChapter: topPerFormersProvider.pageIndex == 0 ? true : false,
              topChaptersModelItem: AppList.topChaptersList[index],
              topMembersModelItem: AppList.topMembersList[index],
            ),
          ),
        );
      },
    );
  }
}
