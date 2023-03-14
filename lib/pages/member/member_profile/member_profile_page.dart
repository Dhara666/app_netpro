import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/member/widgets/member_profile_card_view.dart';

class MemberProfilePage extends StatelessWidget {
  const MemberProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [MemberProfileCardView()]);
  }
}
