import 'package:FindHackathon/Core/Service/Network/Response/Error/error_message.dart';
import 'package:FindHackathon/Views/Screen/Profile/Model/hackathon_model.dart';
import 'package:FindHackathon/Views/Screen/Profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import '../../../Core/Extension/context_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProfileView extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          buildRowInfo(),
          buildExpandedHack(),
        ],
      ),
    );
  }

  Expanded buildExpandedHack() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            buildContainerHack(),
            buildFutureBuilderHackList(),
            buildContainerReview(),
            buildFutureBuilderReviewList(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<List<HackModel>> buildFutureBuilderReviewList() {
    return FutureBuilder(
      future: hackathonService.getHttpList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return buildSizedBoxReview();
            } else {
              final error = snapshot.error as ErrorMessage;
              return Center(
                child: Text("Error"),
              );
            }
            break;
          default:
            return Text("Something went wrong");
        }
      },
    );
  }

  SizedBox buildSizedBoxReview() {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: hackData.length,
        // itemExtent: 150,
        itemBuilder: (context, index) {
          var item = hackData[index];
          return Padding(
            padding: EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 3,
                    spreadRadius: 0,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(item.statusCode.toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(item.statusCode.toString()),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(item.description),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(item.description),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  FutureBuilder<List<HackModel>> buildFutureBuilderHackList() {
    return FutureBuilder(
      future: hackathonService.getHttpList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hackData.length,
                  itemExtent: 150,
                  itemBuilder: (context, index) {
                    var item = hackData[index];
                    return buildPaddingHack(item);
                  },
                ),
              );
            } else {
              final error = snapshot.error as ErrorMessage;
              return Center(
                child: Text("Error"),
              );
            }
            break;
          default:
            return Text("Something went wrong");
        }
      },
    );
  }

  Padding buildPaddingHack(HackModel item) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              item.imageUrl,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black12,
              BlendMode.darken,
            ),
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                item.statusCode.toString(),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildContainerHack() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 25, bottom: 10),
      alignment: Alignment.bottomLeft,
      child: Text(
        "Katıldığım Hackathonlar",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      title: Text(
        "Profile",
        style: TextStyle(
          color: context.theme.primaryColor,
          fontSize: 20,
        ),
      ),
      actions: [IconButton(icon: Icon(Icons.more_vert), onPressed: null)],
    );
  }

  Row buildRowInfo() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                child: Image.network("https://picsum.photos/300")),
            height: 70,
            width: 70,
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Istiak Remon",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: RatingBar(
                  itemSize: 15,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Container buildContainerReview() {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 25, bottom: 10),
      alignment: Alignment.bottomLeft,
      child: Text(
        "Yorumlar",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
