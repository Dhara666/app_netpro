import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/association_add_chapter_provider.dart';
import 'package:net_pro_fan/providers/local_data_provider.dart';
import 'package:provider/provider.dart';

class AssociationChapterButton extends StatelessWidget {
  const AssociationChapterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<AssociationAddChapterProvider,LocalDataProvider>(
  builder: (BuildContext context, AssociationAddChapterProvider associationAddChapterProvider, LocalDataProvider localDataProvider, _) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       AppElevatedButton(
         onPressed: () {},
         text: S.of(context).addMember,
         height: 30,
         width: 90,
         fontSize: 12,
         buttonColor: ColorConstant.appBlue,
       ),
       Align(
         alignment: Alignment.center,
         child: AppElevatedButton(
           onPressed: () {
             associationAddChapterProvider.validateForm(context);
           },
           text: S.of(context).addChapter,
           height: 32,
           width: 100,
           fontSize: 13,
           margin: const EdgeInsets.only(top: 15, bottom: 5),
         ),
       ),
     ],
    );
  },
);
  }
}
