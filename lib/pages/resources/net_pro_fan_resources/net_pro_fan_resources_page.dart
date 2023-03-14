import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/providers/net_pro_fan_resources_provider.dart';
import 'package:provider/provider.dart';

class NetProFanResourcesPage extends StatelessWidget {
  const NetProFanResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NetProFanResourcesProvider>(
      builder: (BuildContext context,
          NetProFanResourcesProvider netProFanResourcesProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: AppList.netProFanResourcesList.length,
          itemBuilder: (context, index) => AppCustomExpansionTile(
            flex: 7,
            onExpansionChanged: ((newState) {
              netProFanResourcesProvider.linkChanged(
                  newState, AppList.netProFanResourcesList[index].link!);
            }),
            trailing: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 13,
              color: Theme.of(context).iconTheme.color,
            ),
            headerBackgroundColor: ColorConstant.appYellow,
            title: AppList.netProFanResourcesList[index].title,
            children: const [],
          ),
        );
      },
    );
  }
}
