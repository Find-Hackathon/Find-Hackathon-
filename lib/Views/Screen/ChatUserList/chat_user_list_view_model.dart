import '../../../Core/Base/base_view_model.dart';

class ChatUserModel extends BaseViewModel {
  String userName;
  String userProfilePicture;
  bool hasUnreadMessages;
  int unreadMessagesCount;
  String lastMessage;
  DateTime lastMessageTime;

  void setUserName(String getUserName) {
    userName = getUserName;
  }

  void setUserProfilePicture(String getUserProfilePicture) {
    userProfilePicture = getUserProfilePicture;
  }

  void setUnreadMessagesCount(int getUnreadMessagesCount) {
    unreadMessagesCount = getUnreadMessagesCount;
    if (unreadMessagesCount > 0) {
      hasUnreadMessages = true;
    }
  }

  void setLastMessage(String getLastMessage) {
    lastMessage = getLastMessage;
  }

  void setLastMessageTime(DateTime getLastMessageTime) {
    lastMessageTime = getLastMessageTime;
  }

  String getUserName() {
    return userName;
  }

  String getUserProfilePicture() {
    return userProfilePicture;
  }

  bool getHasUnreadMessages() {
    return hasUnreadMessages;
  }

  int getUnreadMessagesCount() {
    return unreadMessagesCount;
  }

  String getLastMessage() {
    return lastMessage;
  }

  DateTime getLastMessageTime() {
    return lastMessageTime;
  }

  @override
  void init() {
    // TODO: implement init
  }
}

List<ChatUserModel> mockUsers() {
  List<ChatUserModel> model = new List<ChatUserModel>();
  ChatUserModel userModel = new ChatUserModel();
  userModel.setUnreadMessagesCount(1);
  userModel.setLastMessage("getLastMessage");
  userModel.setLastMessageTime(new DateTime.now());
  userModel.setUserName("getUserName");
  userModel.setUserProfilePicture("assets/images/welcome.png");
  model.add(userModel);
  model.add(userModel);
  model.add(userModel);
  return model;
}
