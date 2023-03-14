import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/events_provider.dart';
import 'package:provider/provider.dart';

class EventYear2020Page extends StatelessWidget {
  const EventYear2020Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(
      builder: (BuildContext context,
          EventsProvider eventsProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppList.eventsYear2020List.length,
          itemBuilder: (context, index) => Container(
            color: ColorConstant.appTransparent,
            child: AppCustomExpansionTile(
              flex: 7,
              onExpansionChanged: ((newState) {
                eventsProvider.linkChanged(
                    newState, AppList.eventsYear2020List[index].link!);
              }),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 13,
                color: Theme.of(context).iconTheme.color,
              ),
              headerBackgroundColor: ColorConstant.appYellow,
              title: AppList.eventsYear2020List[index].title,
              children: const [],
            ),
          ),
        );
      },
    );
  }
}
