import 'package:flutter/material.dart';
import 'package:net_pro_fan/app/widget/app_dropdown_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/providers/events_provider.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(
      builder: (BuildContext context, EventsProvider eventsProvider, _) {
        return Scaffold(
          body: Column(
            children: [
              AppHeaderView(title: S.of(context).events.toUpperCase()),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 20, bottom: 10),
                child: AppDropdownButton(
                  hint: S.of(context).notSelected,
                  dropdownWidth: 345,
                  value: eventsProvider.selectedYear,
                  dropdownItems: eventsProvider.yearList,
                  onChanged: (String? request) {
                    eventsProvider.yearEventsChanged(request);
                    eventsProvider.pageIndex = eventsProvider.pages
                        .indexWhere((element) => element['year'] == request);
                  },
                ),
              ),
              Expanded(
                child: eventsProvider.pageIndex == null
                    ? Center(
                        child: AppText(
                        text: S.of(context).pleaseSelectEventYear,
                        textStyle: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 15,fontWeight: FontWeight.w500),
                      ))
                    : ListView(
                        shrinkWrap: true,
                        primary: true,
                        children: [
                          eventsProvider.pages[eventsProvider.pageIndex!]
                              ['data'] as Widget,
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
