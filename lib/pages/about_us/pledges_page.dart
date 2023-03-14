import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class PledgesPage extends StatelessWidget {
  const PledgesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeaderView(title: S.of(context).pledges.toUpperCase()),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: AppList.pledgesList.length,
            itemBuilder: (context, index) => AppCustomExpansionTile(
              headerBackgroundColor: ColorConstant.appYellow,
              title: AppList.pledgesList[index].title,
              children: [
                Consumer<ThemeProvider>(
                  builder: (BuildContext context, themeProvider, _) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      decoration:
                          ColorConstant.appDecoration(themeProvider.isDarkMode),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: AppList.pledgesList[index].subTitle,
                            textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 12),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            primary: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                AppList.pledgesList[index].content!.length,
                            itemBuilder: (context, contentIndex) => Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 3),
                              child: AppText(
                                text:
                                    '${contentIndex + 1}. ${AppList.pledgesList[index].content![contentIndex]}',
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
