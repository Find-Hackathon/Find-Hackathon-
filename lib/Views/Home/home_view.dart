import 'package:FindHackathon/Core/Constants/App/color.dart';
import 'package:FindHackathon/Views/Home/home_model.dart';
import 'package:FindHackathon/Views/Home/home_view_model.dart';
import 'package:FindHackathon/Views/Screen/HackatonDetail/hackaton_detail_view.dart';
import 'package:FindHackathon/Views/Screen/Profile/profile.dart';
import 'package:FindHackathon/Views/Widgets/bottom_panel.dart';
import 'package:FindHackathon/Views/Widgets/search_text_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var viewModel;
  @override
  @override
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<HomeViewModel>(context);
    viewModel.getData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      appBar: appBar(context),
      body: body(size),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          color: context.theme.accentColor,
          icon: Icon(Icons.menu),
          onPressed: () {
            _globalKey.currentState.showBottomSheet(
              (context) => BottomSheetPanelBody(),
            );
          }),
      elevation: 0,
      titleSpacing: 24.0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: Text(
        'Hackathons',
        style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: context.theme.accentColor),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Profile()));
          },
          child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://pbs.twimg.com/profile_images/669103856106668033/UF3cgUk4_400x400.jpg")),
              )),
        )
      ],
    );
  }

  SingleChildScrollView body(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.0),
          SearchTextField(size: MediaQuery.of(context).size),
          SizedBox(height: 10.0),
          ...viewModel.hackathonList.map(
            (e) => hackathonCard(size, e),
          )

          // ...viewModel.hackathonList.map((e) => hackathonCard(size)).toList();,
        ],
      ),
    );
  }

  Container hackathonCard(Size size, HomeModel homeModel) {
    String imageUrl =
        "https://sm.mashable.com/t/mashable_in/photo/default/hackers-hackathon-india-pandemic-covid-19-lockdown_cxrq.960.jpg";
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: size.width * 0.85,
      child: Card(
        elevation: 6,
        shadowColor: AppColors.kDartGrey.withOpacity(.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HackatonDetail(
                        organizationId: homeModel.id,
                        organizationImage: homeModel.image,
                        organizationName: homeModel.name,
                        organizationDescription: homeModel.description)));
          },
          child: Column(
            children: [
              hackathonCardImage(size, homeModel.image),
              hackathonCardListTile(homeModel)
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect hackathonCardImage(Size size, String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        width: size.width,
        child: AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  ListTile hackathonCardListTile(HomeModel homeModel) {
    return ListTile(
      title: Text(
        homeModel.name.toString(),
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
      ),
      subtitle: Text(
        homeModel.description,
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(fontWeight: FontWeight.w500),
      ),
      trailing: Stack(
        children: [
          hackathonCardAvatar(
              "https://pbs.twimg.com/profile_images/669103856106668033/UF3cgUk4_400x400.jpg"),
          hackathonCardAvatar("https://picsum.photos/200/300"),
          hackathonCardAvatar("https://picsum.photos/200/300"),
          hackathonCardAvatar("https://picsum.photos/200/300"),
        ],
      ),
    );
  }

  CircleAvatar hackathonCardAvatar(String avatarUrl) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
