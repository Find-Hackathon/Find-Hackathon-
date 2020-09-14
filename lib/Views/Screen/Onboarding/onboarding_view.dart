import 'package:FindHackathon/Views/Widgets/fat_button.dart';
import 'package:FindHackathon/Views/Widgets/text_button.dart';
import 'package:flutter/material.dart';

import 'onboarding_view_model.dart';

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
            itemBuilder: (contex, index) {
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
            buildTitle(title),
            Spacer(
              flex: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: buildDescription(desc),
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

  Text buildDescription(String description) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }

  Text buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
/*

Container(
                child: RaisedButton(
                  onPressed: () {                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(161, 223, 197, 0.5),
                            Color.fromRGBO(86, 197, 150, 1)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 100.0, maxHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        slides[slideIndex].getButtonText(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
              */
