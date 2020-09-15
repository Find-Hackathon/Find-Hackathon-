class SliderModel {
  String imagePath;
  String title;
  String description;
  String lowerButtonText;
  String buttonText;
  SliderModel({this.imagePath, this.title, this.description});

  void setImageAssetPath(String getImagepath) {
    imagePath = getImagepath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDesc) {
    description = getDesc;
  }

  void setButtonText(String getButtonText) {
    buttonText = getButtonText;
  }

  void setLowerButtonText(String getLowerButtonTex) {
    lowerButtonText = getLowerButtonTex;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }

  String getButtonText() {
    return buttonText;
  }

  String getLowerButtonText() {
    return lowerButtonText;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  sliderModel.setTitle("Yarışmalara Katıl");
  sliderModel
      .setDescription("Güncel olan yarışmaları görüntüle ve onlara katıl.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/images/illustration2.png");
  sliderModel.setTitle("Takım Arkadaşı Seç");
  sliderModel.setDescription(
      "Takım arkadaşın yoksa niteliklerine göre eşleşebilirsin.");
  // sliderModel.setButtonText("Next");
  // sliderModel.setLowerButtonText("Skip This");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/images/illustration3.png");
  sliderModel.setTitle("Puanları Topla");
  sliderModel.setDescription("Kazandıkça puanları topla ve ödülleri kazan.");
  // sliderModel.setButtonText("Next");
  // sliderModel.setLowerButtonText("Skip This");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
