import 'package:flutter/material.dart';
import 'package:net_pro_fan/pages/association/widgets/association_member_tab_bar_view.dart';
import 'package:net_pro_fan/providers/association_member_provider.dart';
import 'package:provider/provider.dart';

class AssociationMemberPage extends StatelessWidget {
  const AssociationMemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationMemberProvider>(
      builder: (context, associationMemberProvider, _) {
        return Scaffold(
          appBar: AssociationMemberTabBarView(),
          body: associationMemberProvider.pages[associationMemberProvider.pageIndex],
        );
      },
    );
  }
}
