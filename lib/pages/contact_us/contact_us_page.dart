import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:net_pro_fan/app/widget/app_button.dart';
import 'package:net_pro_fan/app/widget/app_header_view.dart';
import 'package:net_pro_fan/app/widget/app_text.dart';
import 'package:net_pro_fan/app/widget/app_text_field.dart';
import 'package:net_pro_fan/constant/app_list.dart';
import 'package:net_pro_fan/constant/color_constant.dart';
import 'package:net_pro_fan/generated/l10n.dart';
import 'package:net_pro_fan/pages/contact_us/widgets/contact_us_list_tile.dart';
import 'package:net_pro_fan/providers/contact_us_provider.dart';
import 'package:net_pro_fan/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<ContactUsProvider, ThemeProvider>(
        builder: (BuildContext context, ContactUsProvider contactUsProvider,
            ThemeProvider themeProvider, _) {
          return Column(
            children: [
              AppHeaderView(title: S.of(context).contactHeader.toUpperCase()),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  primary: true,
                  children: [
                    const SizedBox(height: 8,),
                    ContactUsListTile(
                      contactUsModel: AppList.contactUsList,
                    ),
                    contactUsForm(context, themeProvider, contactUsProvider),
                    mapView(context, contactUsProvider)
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Stack mapView(BuildContext context, contactUsProvider) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: GoogleMap(
            zoomControlsEnabled: true,
            initialCameraPosition: contactUsProvider.initialLocation,
            mapType: MapType.terrain,
            onMapCreated: (GoogleMapController controller) {
              contactUsProvider.googleMapController.complete(controller);
            },
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          ),
        ),
        AppElevatedButton(
          width: 60,
          height: 30,
          margin: const EdgeInsets.only(left: 5, top: 5),
          text: S.of(context).direction,
          fontSize: 11,
          buttonColor: ColorConstant.appBlue,
          onPressed: () =>
              contactUsProvider.onGoogleLink(contactUsProvider.googleMapUrl),
        )
      ],
    );
  }

  Container contactUsForm(
      BuildContext context, themeProvider, contactUsProvider) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 33, top: 25),
      decoration: BoxDecoration(
        color: ColorConstant.appGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        margin: const EdgeInsets.all(14),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: themeProvider.isDarkMode
                ? ColorConstant.appLightGrey.withOpacity(0.5)
                : ColorConstant.appLightGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: AppText(
                  text: S.of(context).contactUs,
                  textStyle: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 16)),
            ),
            const SizedBox(
              height: 10,
            ),
            AppTextField(
              hint: S.of(context).firstName,
              controller: contactUsProvider.firstNmeController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              hint: S.of(context).lastName,
              controller: contactUsProvider.lastNmeController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              hint: S.of(context).emailHint,
              keyboardType: TextInputType.emailAddress,
              controller: contactUsProvider.emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              hint: S.of(context).subject,
              controller: contactUsProvider.subjectController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              hint: S.of(context).messageHint,
              controller: contactUsProvider.messageController,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: AppElevatedButton(
                onPressed: () {
                  contactUsProvider.validateForm(context);
                },
                text: S.of(context).submit,
                height: 40,
                width: 90,
                margin: const EdgeInsets.only(top: 15, bottom: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
