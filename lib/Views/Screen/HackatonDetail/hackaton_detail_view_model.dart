import 'package:FindHackathon/Core/Base/base_view_model.dart';

class HackatonDetaildViewModel extends BaseViewModel {
  String name;
  String description;
  int stars;

  void setName(String getName) {
    name = getName;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  void setStars(int getStars) {
    stars = getStars;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  int getStars() {
    return stars;
  }

  @override
  void init() {
    // TODO: implement init
  }
}
