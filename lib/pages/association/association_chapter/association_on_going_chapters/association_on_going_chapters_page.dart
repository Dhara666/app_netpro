import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_loader.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/association/widgets/association_chapter_card_view.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';
import 'package:provider/provider.dart';

class AssociationOnGoingChaptersPage extends StatefulWidget {
  const AssociationOnGoingChaptersPage({Key? key}) : super(key: key);

  @override
  State<AssociationOnGoingChaptersPage> createState() => _AssociationOnGoingChaptersPageState();
}

class _AssociationOnGoingChaptersPageState extends State<AssociationOnGoingChaptersPage> {
  @override
  void initState() {
    // TODO: implement initState
    AssociationChapterProvider associationChapterProvider = Provider.of<AssociationChapterProvider>(context, listen: false);
    associationChapterProvider.getOnGoingChapters(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationChapterProvider>(builder: (context, associationChapterProvider, _) {
      return Stack(
        children: [
          associationChapterProvider.onGoingChaptersModels.isNotEmpty
              ? ListView.builder(
                  itemCount: associationChapterProvider.onGoingChaptersModels.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => AssociationChapterCardView(
                        chapterModel: associationChapterProvider.onGoingChaptersModels[index],
                        isOnGoingChapters: true,
                      ))
              : Center(
                  child: AppText(text: S.of(context).noOnGoingChaptersAvailable, textStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14)),
                ),
          associationChapterProvider.isLoading ? const AppLoader() : const SizedBox()
        ],
      );
    });
  }
}
