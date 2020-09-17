import '../../../Core/Extension/context_extension.dart';
import '../Welcome/WelcomeScreen.dart';
import '../../Widgets/fat_button.dart';
import 'package:flutter/material.dart';

import 'onboarding_view_model.dart';

class OnboardingHome extends StatefulWidget {
  OnboardingHome({Key key}) : super(key: key);

  @override
  _OnboardingHomeState createState() => _OnboardingHomeState();
}

bool isVisible = false;

class _OnboardingHomeState extends State<OnboardingHome> {
  List<SliderModel> slides = new List<SliderModel>();
  int slideIndex = 0;

  /*
  PageController _controller;
  var currentPageValue = 0.0;
*/
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SliderTile(
                  assetPath: slides[index].getImageAssetPath(),
                  desc: slides[index].getDescription(),
                  title: slides[index].getTitle(),
                  index: index,
                  itemCount: slides.length,
                  slideIndex: slideIndex);
            }),
        bottomNavigationBar: buildAnimatedContainerRow(slideIndex),
      ),
    );
  }

  Padding buildAnimatedContainerRow(slideIndex) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 5),
              duration: Duration(milliseconds: 300),
              width: slideIndex == 0 ? 50 : 10,
              height: 10,
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(10))),
          AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 5),
              duration: Duration(milliseconds: 300),
              width: slideIndex == 1 ? 50 : 10,
              height: 10,
              decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(10))),
          AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 5),
              duration: Duration(milliseconds: 300),
              width: slideIndex == 2 ? 50 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ))
        ],
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String assetPath, title, desc;
  final int index, itemCount;
  final int slideIndex;

  SliderTile(
      {this.assetPath,
      this.title,
      this.desc,
      this.index,
      this.itemCount,
      this.slideIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.backgroundColor,
      child: Container(
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 25,
            ),
            Image.asset(assetPath),
            Spacer(
              flex: 50,
            ),
            buildTitle(title, context),
            Spacer(
              flex: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: buildDescription(desc, context),
            ),
            Spacer(
              flex: 15,
            ),
            Visibility(
              visible: index == 2 ? true : false,
              child: FatButton(
                text: "Uygulamaya Geçiş Yap.",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
              ),
            ),
            Spacer(
              flex: 15,
            )
          ],
        ),
      ),
    );
  }

  Text buildDescription(String description, BuildContext context) {
    return Text(desc,
        textAlign: TextAlign.center, style: context.textTheme.bodyText1);
  }

  Text buildTitle(String title, BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: context.textTheme.headline5.copyWith(
          fontWeight: FontWeight.bold,
          color: context.theme.primaryColor,
        ));
  }
}
