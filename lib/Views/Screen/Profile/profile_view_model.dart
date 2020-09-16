import 'package:FindHackathon/Views/Screen/Profile/Model/hackathon_model.dart';
import 'package:FindHackathon/Views/Screen/Profile/Service/IHackathon_service.dart';
import 'package:FindHackathon/Views/Screen/Profile/Service/hackathon_service.dart';
import 'package:FindHackathon/Views/Screen/Profile/profile.dart';
import 'package:flutter/material.dart';

abstract class ProfileViewModel extends State<Profile> {
  bool isLoading = false;
  List<HackModel> hackData = [];

  IHackathonService hackathonService;

  @override
  void initState() {
    super.initState();
    hackathonService = HackathonService();
    callItems();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHackData();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (hackData.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text("Opps.. Something get wrong"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getHackData() async {
    hackData = await hackathonService.getHttpList();
  }
}
