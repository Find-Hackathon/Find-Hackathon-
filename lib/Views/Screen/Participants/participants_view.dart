import 'package:FindHackathon/Views/Screen/Participants/participants_view_model.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
import 'package:FindHackathon/Views/Widgets/star_display.dart';
import 'package:flutter/material.dart';

import '../../../Core/Extension/context_extension.dart';

class PartipicantsView extends StatefulWidget {
  PartipicantsView({Key key}) : super(key: key);

  @override
  _PartipicantsViewState createState() => _PartipicantsViewState();
}

class _PartipicantsViewState extends State<PartipicantsView> {
  final items = List<String>.generate(10, (i) => "Item $i");

  List<String> litems = [
    "https://picsum.photos/id/1/200/300",
    "https://picsum.photos/id/2/200/300",
    "https://picsum.photos/id/3/200/300",
    "https://picsum.photos/id/4/200/300",
    "https://picsum.photos/id/5/200/300",
    "https://picsum.photos/id/6/200/300",
    "https://picsum.photos/id/7/200/300",
    "https://picsum.photos/id/8/200/300",
    "https://picsum.photos/id/9/200/300",
    "https://picsum.photos/id/10/200/300",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarPartipicants(context),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return buildListTileCards(context, index);
        },
      ),
    );
  }

  ListTile buildListTileCards(BuildContext context, int index) {
    return ListTile(
      title: Card(
        child: Container(
          padding: EdgeInsets.all(context.constHighValue),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.constHighValue),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(litems[index]),
                  backgroundColor: Colors.transparent,
                ),
              ),
              buildColumnName(index, context),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumnName(int index, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            '${items[index]}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.constHighValue,
            ),
          ),
        ),
        buildRowStars(),
      ],
    );
  }

  Row buildRowStars() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTheme(
          data: IconThemeData(
            color: Colors.amber,
          ),
          child: StarRating(
            size: 30,
            value: 4,
          ),
        ),
      ],
    );
  }

  Align buildAlignAvatarProfile() {
    return Align(
      alignment: Alignment.centerLeft,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage("https://picsum.photos/200"),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  AppBar buildAppBarPartipicants(BuildContext context) {
    return AppBar(
      title: Text(
        "Katılımcılar",
        style: TextStyle(
          color: context.theme.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () {},
      ),
    );
  }
}
