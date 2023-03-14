import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';

class AboutCustomStepper extends StatelessWidget {
  final String? title;
  final List? contentList;

  const AboutCustomStepper({Key? key, this.title, this.contentList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 5),
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                  color: ColorConstant.appYellow,
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorConstant.appWhite)),
            ),
            AppText(
                text: title, textStyle: Theme.of(context).textTheme.subtitle1),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 14),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
                border:
                    Border(left: BorderSide(color: ColorConstant.appYellow))),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: contentList!.length,
              itemBuilder: (context, index) => AppText(
                  text: '${'\u2022'} ${contentList![index]}',
                  textStyle: Theme.of(context).textTheme.subtitle2),
            )),
      ],
    );
  }
}

