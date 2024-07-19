class UserDataEntity {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userImage;
  final String userId;
  final String userToken;

  UserDataEntity(
      {required this.userToken,
      required this.userName,
      required this.userEmail,
      required this.userPhone,
      required this.userImage,
      required this.userId});
}
