import 'package:FindHackathon/Core/Constants/App/color.dart';
import 'package:FindHackathon/Views/Home/home_view_model.dart';
import 'package:FindHackathon/Views/Widgets/search_text_row.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    viewModel = HomeViewModel();
    return Scaffold(
      appBar: appBar(context),
      body: body(size),
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
        'Hackathons',
        style: Theme.of(context).textTheme.headline6.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.0,
            color: Color(0xFF56C596)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
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
          ...viewModel.hackathonList.map((e) => hackathonCard(size)).toList(),
        ],
      ),
    );
  }

  Container hackathonCard(Size size) {
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
        child: Column(
          children: [
            hackathonCardImage(size, imageUrl),
            hackathonCardListTile()
          ],
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

  ListTile hackathonCardListTile() {
    return ListTile(
      title: Text(
        'VBT Hackathon',
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
      ),
      subtitle: Text(
        'VBT Teknoloji',
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
