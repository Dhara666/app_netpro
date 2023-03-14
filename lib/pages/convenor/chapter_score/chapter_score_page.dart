import 'package:flutter/material.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/pages/convenor/widgets/chapter_card_view.dart';

class ChapterScorePage extends StatelessWidget {
  const ChapterScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppList.chapterList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => ChapterCardView(
                  isScore: true,
                  chapterModel: AppList.chapterList[index],
                )),
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
