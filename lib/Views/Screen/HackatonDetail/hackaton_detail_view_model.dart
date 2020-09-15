import 'package:FindHackathon/Core/Base/base_view_model.dart';

class HackatonDetailModel extends BaseViewModel {
  String name;
  String description;
  int stars;
  List<String> imagePaths;
//Todo:User,Profile Pictures
  void setName(String getName) {
    name = getName;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  void setStars(int getStars) {
    stars = getStars;
  }

  void addImagePath(String getImagePath) {
    imagePaths.add(getImagePath);
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  List<String> getImagePaths() {
    return imagePaths;
  }

  int getStars() {
    return stars;
  }

  @override
  void init() {
    // TODO: implement init
  }
}

HackatonDetailModel getHackatonDetail() {
  HackatonDetailModel model = new HackatonDetailModel();
  model.imagePaths = new List<String>();
  model.setName("VBT Hackaton");
  model.setDescription(
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here'");
  model.imagePaths.add('assets/images/hackatonPlaceHolder1.png');
  model.imagePaths.add('assets/images/hackatonPlaceHolder2.png');
  model.imagePaths.add('assets/images/hackatonPlaceHolder3.png');
  model.setStars(4);
  return model;
}

