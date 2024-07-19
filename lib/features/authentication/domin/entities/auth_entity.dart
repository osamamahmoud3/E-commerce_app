class AuthEntity {
  final String token;
  final String name;
  final String phoneNumber;
  final String email;
  final bool statuss;
  final String responsemessage;

  AuthEntity(
      {required this.token,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.statuss,
      required this.responsemessage});
}
