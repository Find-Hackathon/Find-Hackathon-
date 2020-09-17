import 'dart:ui' show Radius;

import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Screen/HackatonDetail/hackaton_detail_view_model.dart';
import 'package:FindHackathon/Views/Widgets/fat_button.dart';
import 'package:FindHackathon/Views/Widgets/star_display.dart';
import 'package:flutter/material.dart';

class HackatonDetail extends StatefulWidget {
  HackatonDetail({Key key}) : super(key: key);

  @override
  _HackatonDetailState createState() => _HackatonDetailState();
}

class _HackatonDetailState extends State<HackatonDetail> {
  HackatonDetailModel detailModel = new HackatonDetailModel();
  @override
  void initState() {
    // TODO: implement initState

    detailModel = getHackatonDetail();
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
              buildStars(context),
              buildHackatonDescription(context),
              Spacer(
                flex: 1,
              ),
              FatButton(
                text: "Katıl",
                onPressed: () {},
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
      margin: EdgeInsets.symmetric(horizontal: context.constLowValue),
      child: Text(
        detailModel.description,
        style: context.textTheme.bodyText2,
      ),
    );
  }

  Container buildStars(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: StarRating(
        size: MediaQuery.of(context).size.width * 0.07,
        value: detailModel.getStars(),
      ),
    );
  }

  Expanded buildHackatonName(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.constLowValue),
        alignment: Alignment.centerLeft,
        child: Text(
          detailModel.name,
          style: context.textTheme.headline5,
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 24.0,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Color(0xFF56C596)),
      centerTitle: false,
      title: Text(
        'Hackathon Detayları',
        style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: Color(0xFF56C596)),
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
              child: PageView.builder(
            itemBuilder: (context, index) {
              return Image.asset(
                detailModel.imagePaths[index],
                fit: BoxFit.cover,
              );
            },
            itemCount: detailModel.imagePaths.length,
          ))),
    );
  }
}
