import 'dart:ui';

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
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(
                flex: 5,
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
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  detailModel.name,
                  style: context.textTheme.headline4,
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  Text(detailModel.stars.toString()),
                  Icon(Icons.star,
                      color:
                          detailModel.stars >= 1 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star,
                      color:
                          detailModel.stars >= 2 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star,
                      color:
                          detailModel.stars >= 3 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star,
                      color:
                          detailModel.stars >= 4 ? Colors.yellow : Colors.grey),
                  Icon(Icons.star,
                      color:
                          detailModel.stars >= 5 ? Colors.yellow : Colors.grey)
                ],
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                detailModel.description,
                style: context.textTheme.bodyText2,
              ),
              Spacer(
                flex: 1,
              ),
              FatButton(
                text: "Join",
              ),
              Spacer(
                flex: 1,
              )
            ],
          )),
    );
  }
}
