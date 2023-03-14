import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppText(
          text: 'FAQ',
          textStyle: Theme
              .of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 13),
        )
    );
  }
}
