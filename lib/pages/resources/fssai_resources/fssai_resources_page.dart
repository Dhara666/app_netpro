import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_custom_expansion_tile.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/resources/widgets/books_card_view.dart';
import 'package:net_pro_fan/pages/resources/widgets/poster_card_view.dart';
import 'package:net_pro_fan/providers/fssai_resources_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class FssaiResourcesPage extends StatelessWidget {
  const FssaiResourcesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<FssaiResourcesProvider, ThemeProvider>(
      builder: (BuildContext context,
          FssaiResourcesProvider fssaiResourcesProvider,
          ThemeProvider themeProvider,
          _) {
        return ListView(
          children: [
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                fssaiResourcesProvider.onExpansionChanged(newState);
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).books.toUpperCase(),
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.fssaiResourcesBooksList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BooksCardView(
                          bookName:
                              AppList.fssaiResourcesBooksList[index].title!,
                          onTap: () => fssaiResourcesProvider.onBooksLink(
                              AppList.fssaiResourcesBooksList[index].link!),
                        ))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                fssaiResourcesProvider.onExpansionChanged(newState);
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).poster.toUpperCase(),
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.fssaiResourcesPosterList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => PosterCardView(
                        image: AppList.fssaiResourcesPosterList[index].image!))
              ],
            ),
            AppCustomExpansionTile(
              onExpansionChanged: ((newState) {
                fssaiResourcesProvider.onExpansionChanged(newState);
              }),
              headerBackgroundColor: ColorConstant.appYellow,
              title: S.of(context).video.toUpperCase(),
              children: const [],
            ),
          ],
        );
      },
    );
  }
}
