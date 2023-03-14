import 'package:flutter/material.dart';
import 'package:net_pro_fan/constant/app_asset.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/convenor/widgets/pending_request_list_tile.dart';

class ActivityCardView extends StatelessWidget {
  const ActivityCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PendingRequestListTile(
            leadingImage: AppAsset.commentsIcon,
            title: "${S.of(context).contentCreation} (0)".toUpperCase()),
        PendingRequestListTile(
            leadingImage: AppAsset.taskIcon,
            title: "${S.of(context).trainingAndCapacityBuilding} (0)"
                .toUpperCase()),
        PendingRequestListTile(
            leadingImage: AppAsset.taskIcon,
            title: "${S.of(context).massDissemination} (0)".toUpperCase()),
        PendingRequestListTile(
            leadingImage: AppAsset.commentsIcon,
            title: "${S.of(context).outreachActivity} (0)".toUpperCase()),
      ],
    );
  }
}
