import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/pages/about_us/widgets/right_arrow.dart';

class AboutRightArrowView extends StatelessWidget {
  final String? title;

  const AboutRightArrowView({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 65,
      child: CustomPaint(
        painter: RightArrow(ColorConstant.appBlue),
        child: Align(
          alignment: const Alignment(-.2, 0),
          child: AppText(
              text: title,
              textStyle: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: ColorConstant.appWhite, fontSize: 10)),
        ),
      ),
    );
  }
}
