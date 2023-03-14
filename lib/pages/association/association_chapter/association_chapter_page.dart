import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/association/widgets/association_chapter_tab_bar_view.dart';
import 'package:net_pro_fan/providers/association_chapter_provider.dart';
import 'package:provider/provider.dart';

class AssociationChapterPage extends StatelessWidget {
  const AssociationChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationChapterProvider>(
      builder: (context, associationChapterProvider, _) {
        return Scaffold(
          appBar: AssociationChapterTabBarView(),
          body: associationChapterProvider.pages[associationChapterProvider.pageIndex],
        );
      },
    );
  }
}
