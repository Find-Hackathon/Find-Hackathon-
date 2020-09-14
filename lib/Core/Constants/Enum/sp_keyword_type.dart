enum SpKeywordType { EMAIL, PASSWORD, IS_LOGGED_IN }

extension SpKeywordTypeExtension on SpKeywordType {
  get name {
    switch (this) {
      case SpKeywordType.EMAIL:
        return 'email';
      case SpKeywordType.PASSWORD:
        return 'password';
      case SpKeywordType.IS_LOGGED_IN:
        return 'isLoggedIn';
    }
  }
}
