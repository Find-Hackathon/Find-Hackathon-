import 'dart:ui' show Radius;

import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Screen/HackatonDetail/hackaton_detail_view_model.dart';
import 'package:FindHackathon/Views/Widgets/fat_button.dart';
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
            text: "Join",
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

  Expanded buildStars(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: context.constLowValue),
        child: Row(
          children: [
            Icon(Icons.star,
                color: detailModel.stars >= 1 ? Colors.yellow : Colors.grey),
            Icon(Icons.star,
                color: detailModel.stars >= 2 ? Colors.yellow : Colors.grey),
            Icon(Icons.star,
                color: detailModel.stars >= 3 ? Colors.yellow : Colors.grey),
            Icon(Icons.star,
                color: detailModel.stars >= 4 ? Colors.yellow : Colors.grey),
            Icon(Icons.star,
                color: detailModel.stars >= 5 ? Colors.yellow : Colors.grey)
          ],
        ),
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
