import 'package:FindHackathon/Views/Screen/Profile/Model/hackathon_model.dart';

abstract class IHackathonService {
  Future<List<HackModel>> getHttpList();
}
