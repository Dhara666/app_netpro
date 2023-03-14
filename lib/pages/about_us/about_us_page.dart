import 'package:flutter/material.dart';
import 'package:net_pro_fan/providers/about_us_provider.dart';
import 'package:provider/provider.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsProvider>(
      builder: (BuildContext context, AboutUsProvider aboutUsProvider, _) {
        return Scaffold(
          body: aboutUsProvider.pages[aboutUsProvider.pageIndex],
        );
      },
    );
  }
}
