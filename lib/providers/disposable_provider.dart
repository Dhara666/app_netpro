import 'package:flutter/material.dart';
import 'package:net_pro_fan/providers/add_activity_provider.dart';
import 'package:net_pro_fan/providers/add_member_provider.dart';
import 'package:net_pro_fan/providers/association_add_chapter_provider.dart';
import 'package:net_pro_fan/providers/association_provider.dart';
import 'package:net_pro_fan/providers/chapter_activity_provider.dart';
import 'package:net_pro_fan/providers/convenor_provider.dart';
import 'package:net_pro_fan/providers/events_provider.dart';
import 'package:net_pro_fan/providers/member_add_activity_provider.dart';
import 'package:net_pro_fan/providers/member_provider.dart';
import 'package:net_pro_fan/providers/register_provider.dart';
import 'package:net_pro_fan/providers/resources_provider.dart';
import 'package:net_pro_fan/providers/top_performers_provider.dart';
import 'package:provider/provider.dart';

abstract class DisposableProvider with ChangeNotifier {
  void disposeValues();
  void disposeAllValues();
}

class DisposeAllProviders {
  static List<DisposableProvider> getDisposableProviders(BuildContext context) {
    return [
      Provider.of<TopPerFormersProvider>(context, listen: false),
      Provider.of<ResourcesProvider>(context, listen: false),
      Provider.of<EventsProvider>(context, listen: false),
      Provider.of<ChapterActivityProvider>(context, listen: false),
      Provider.of<AssociationProvider>(context, listen: false),
      Provider.of<MembersProvider>(context, listen: false),
      Provider.of<ConvenorProvider>(context, listen: false),
      Provider.of<AssociationAddChapterProvider>(context, listen: false),
      Provider.of<RegisterProvider>(context, listen: false),
      Provider.of<AddMemberProvider>(context, listen: false),
    ];
  }

  static List<DisposableProvider> getConvenorActivityDisposableProvider(BuildContext context) {
    return [
      Provider.of<AddActivityProvider>(context, listen: false),
    ];
  }

  static List<DisposableProvider> getMemberActivityDisposableProvider(BuildContext context) {
    return [
      Provider.of<MemberAddActivityProvider>(context, listen: false),
    ];
  }

  static void disposeAllDisposableProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProvider) {
      disposableProvider.disposeValues();
      disposableProvider.disposeAllValues();
    });
  }

  static void disposeConvenorAddActivityProvider(BuildContext context) {
    getConvenorActivityDisposableProvider(context).forEach((disposableProvider) {
      disposableProvider.disposeValues();
      disposableProvider.disposeAllValues();
    });
  }

  static void disposeMemberAddActivityProvider(BuildContext context) {
    getMemberActivityDisposableProvider(context).forEach((disposableProvider) {
      disposableProvider.disposeValues();
      disposableProvider.disposeAllValues();
    });
  }
}
