import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/home/widgets/home_about_view.dart';
import 'package:net_pro_fan/pages/home/widgets/home_background_view.dart';
import 'package:net_pro_fan/pages/home/widgets/home_contactus_view.dart';
import 'package:net_pro_fan/pages/home/widgets/home_header_view.dart';
import 'package:net_pro_fan/pages/home/widgets/home_slider_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackGroundView(),
        Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                primary: true,
                children: const [
                  HomeHeaderView(),
                  SizedBox(height: 70),
                  HomeSliderView(),
                  HomeAboutView(),
                  HomeContactUsView(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
