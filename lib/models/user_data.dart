class UserData {
  static final UserData _singleton = UserData._internal();

  factory UserData() {
    return _singleton;
  }

  UserData._internal();

  int cigarettesPerDay = 0;
  int pricePerPack = 0;
}
