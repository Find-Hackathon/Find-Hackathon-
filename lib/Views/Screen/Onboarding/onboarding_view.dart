import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Widgets/fat_button.dart';
import 'package:FindHackathon/Views/Widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:FindHackathon/Core/Theme/textTheme.dart';
import 'onboarding_view_model.dart';
import 'package:flutter/material.dart';

class OnboardingHome extends StatefulWidget {
  OnboardingHome({Key key}) : super(key: key);

  @override
  _OnboardingHomeState createState() => _OnboardingHomeState();
}

class _OnboardingHomeState extends State<OnboardingHome> {
  List<SliderModel> slides = new List<SliderModel>();
  int slideIndex;
  /*
  PageController _controller;
  var currentPageValue = 0.0;
*/
  @override
  void initState() {
    // TODO: implement initState

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
      ),
    );
  }
}

class SliderTile extends StatelessWidget {
  final String assetPath, title, desc;
  final int index, itemCount;
  int slideIndex;
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
      color: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 25,
            ),
            Image.asset(assetPath),
            Spacer(
              flex: 25,
            ),
            Spacer(
              flex: 5,
            ),
            buildAnimatedContainerRow(),
            Spacer(
              flex: 20,
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
            FatButton(
              text: "Text",
            ),
            Spacer(
              flex: 15,
            )
          ],
        ),
      ),
    );
  }

  Row buildAnimatedContainerRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 5),
            duration: Duration(milliseconds: 300),
            width: slideIndex == 0 ? 50 : 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10))),
        AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 5),
            duration: Duration(milliseconds: 300),
            width: slideIndex == 1 ? 50 : 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10))),
        AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 5),
            duration: Duration(milliseconds: 300),
            width: slideIndex == 2 ? 50 : 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)))
      ],
    );
  }

  Text buildDescription(String description, BuildContext context) {
    return Text(desc,
        textAlign: TextAlign.center, style: context.textTheme.bodyText2);
  }

  Text buildTitle(String title, BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: context.textTheme.headline1,
    );
  }
}
