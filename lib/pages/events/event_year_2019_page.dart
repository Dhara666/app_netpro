import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/app/widget/app_image_assets.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/events_provider.dart';
import 'package:provider/provider.dart';

class EventYear2019Page extends StatelessWidget {
  const EventYear2019Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(
      builder: (BuildContext context,
          EventsProvider eventsProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: AppList.eventsYear2019List.length,
          itemBuilder: (context, index) => AppCustomExpansionTile(
            onExpansionChanged: ((newState) {
              eventsProvider.onExpansionChanged();
            }),
            headerBackgroundColor: ColorConstant.appYellow,
            title: AppList.eventsYear2019List[index].title,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppImageAsset(
                  image: AppList.eventsYear2019List[index].image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
