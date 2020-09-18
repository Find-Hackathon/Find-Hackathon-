import 'dart:ui' show Radius;

import 'package:FindHackathon/Core/Extension/string_extension.dart';
import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Screen/HackatonDetail/hackaton_detail_view_model.dart';
import 'package:FindHackathon/Views/Screen/Profile/Service/hackathon_service.dart';
import 'package:FindHackathon/Views/User.dart';
import 'package:FindHackathon/Views/Widgets/bottom_navigation_bar.dart';
import 'package:FindHackathon/Views/Widgets/fat_button.dart';
import 'package:FindHackathon/Views/Widgets/star_display.dart';
import 'package:flutter/material.dart';

class HackatonDetail extends StatefulWidget {
  final String organizationId;
  final String organizationImage;
  final String organizationName;
  final String organizationDescription;
  const HackatonDetail(
      {Key key,
      this.organizationId,
      this.organizationImage,
      this.organizationName,
      this.organizationDescription})
      : super(key: key);

  @override
  _HackatonDetailState createState() => _HackatonDetailState();
}

class _HackatonDetailState extends State<HackatonDetail> {
  String organizationUrl =
      "https://find-hackathon.herokuapp.com/organizations/id/";

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: appBar(context),
          //TODO:BottomNavigationBar
          body: Column(
            children: [
              buildHackatonPictures(context),
              buildHackatonName(context),
              //buildStars(context),
              buildHackatonDescription(context),
              Spacer(
                flex: 1,
              ),
              FatButton(
                text: "join".locale,
                onPressed: () async {
                  String response = await (subscribeToOrganization(
                      User.userId, widget.organizationId));
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) => AlertDialog(title: Text(response)));
                },
              ),
              Spacer(
                flex: 1,
              ),
            ],
          )),
    );
  }

  Container buildHackatonDescription(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.constHighValue),
      child: Text(
        widget.organizationDescription,
        style: context.textTheme.bodyText2,
      ),
    );
  }

/*
  Container buildStars(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: StarRating(
        size: MediaQuery.of(context).size.width * 0.07,
        value: detailModel.getStars(),
      ),
    );
  }
*/
  Expanded buildHackatonName(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.constHighValue),
        alignment: Alignment.centerLeft,
        child: Text(
          widget.organizationName,
          style: Theme.of(context).textTheme.headline6.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 22.0,
              color: context.theme.accentColor),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 24.0,
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Color(0xFF56C596)),
      centerTitle: false,
      leading: IconButton(
          icon: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: context.theme.accentColor),
        onPressed: () {
          Navigator.pop(context,
              MaterialPageRoute(builder: (context) => NavigationBar()));
        },
      )),
      title: Text(
        'Hackathon Detayları'.locale,
        style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: context.theme.accentColor),
      ),
    );
  }

  Expanded buildHackatonPictures(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(context.constMediumValue),
              bottomRight: Radius.circular(context.constMediumValue)),
          child: Container(
              child: Image.network(
            widget.organizationImage,
            fit: BoxFit.cover,
          ))),
    );
  }
}
/*
ilerde kullanmak için şimdilik vaz geçildi
child: PageView.builder(
            itemBuilder: (context, index) {
              return Image.asset(
                detailModel.imagePaths[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: detailModel.imagePaths.length,
          )
          */
