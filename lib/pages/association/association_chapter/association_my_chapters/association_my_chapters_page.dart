import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_loader.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/association/widgets/association_chapter_card_view.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';
import 'package:provider/provider.dart';

class AssociationMyChaptersPage extends StatefulWidget {
  const AssociationMyChaptersPage({Key? key}) : super(key: key);

  @override
  State<AssociationMyChaptersPage> createState() => _AssociationMyChaptersPageState();
}

class _AssociationMyChaptersPageState extends State<AssociationMyChaptersPage> {
  @override
  void initState() {
    // TODO: implement initState
    AssociationChapterProvider associationChapterProvider = Provider.of<AssociationChapterProvider>(context, listen: false);
    associationChapterProvider.getMyChapters(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationChapterProvider>(builder: (context, associationChapterProvider, _) {
      return Stack(
        children: [
          ListView.builder(
            itemCount: associationChapterProvider.myChaptersModels.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => associationChapterProvider.myChaptersModels.isNotEmpty
                ? AssociationChapterCardView(
                    chapterModel: associationChapterProvider.myChaptersModels[index],
                    isMyChapters: true,
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
