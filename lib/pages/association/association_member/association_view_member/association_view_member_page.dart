import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_loader.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/association/widgets/association_member_card_view.dart';
import 'package:net_pro_fan/providers/association_member_provider.dart';
import 'package:provider/provider.dart';

class AssociationViewMemberPage extends StatefulWidget {
  const AssociationViewMemberPage({Key? key}) : super(key: key);

  @override
  State<AssociationViewMemberPage> createState() => _AssociationViewMemberPageState();
}

class _AssociationViewMemberPageState extends State<AssociationViewMemberPage> {
  @override
  void initState() {
    // TODO: implement initState
    AssociationMemberProvider associationMemberProvider = Provider.of<AssociationMemberProvider>(context, listen: false);
    associationMemberProvider.getViewMembers(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssociationMemberProvider>(builder: (context, associationMemberProvider, _) {
      return Stack(
        children: [
          ListView.builder(
            itemCount: associationMemberProvider.viewMembersModel.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return associationMemberProvider.viewMembersModel.isNotEmpty
                  ? AssociationMemberCardView(
                      assoiciationMemberModel: associationMemberProvider.viewMembersModel[index],
                    )
                  : Center(
                      child: AppText(text: S.of(context).noMembersAvailable, textStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15)),
                    );
            },
          ),
          associationMemberProvider.isLoading ? const AppLoader() : const SizedBox()
        ],
      );
    });
  }
}
