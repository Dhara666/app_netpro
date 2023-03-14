import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_loader.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/association/widgets/association_chapter_card_view.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';
import 'package:provider/provider.dart';

class AssociationAllChaptersPage extends StatefulWidget {
  const AssociationAllChaptersPage({Key? key}) : super(key: key);

  @override
  State<AssociationAllChaptersPage> createState() => _AssociationAllChaptersPageState();
}

class _AssociationAllChaptersPageState extends State<AssociationAllChaptersPage> {
  @override
  void initState() {
    // TODO: implement initState
    AssociationChapterProvider associationChapterProvider = Provider.of<AssociationChapterProvider>(context, listen: false);
    associationChapterProvider.getAllChapters(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationChapterProvider>(builder: (context, associationChapterProvider, _) {
      return Stack(
        children: [
          ListView.builder(
            itemCount: associationChapterProvider.allChaptersModels.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => associationChapterProvider.allChaptersModels.isNotEmpty
                ? AssociationChapterCardView(
                    chapterModel: associationChapterProvider.allChaptersModels[index],
              isAllChapters: true,
                  )
                : Center(
                    child: AppText(text: S.of(context).noChaptersAvailable, textStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15)),
                  ),
          ),
          associationChapterProvider.isLoading ? const AppLoader() : const SizedBox()
        ],
      );
    });
  }
}
