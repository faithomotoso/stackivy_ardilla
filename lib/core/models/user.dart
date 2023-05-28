class User {
  String firstName;
  String lastName;
  String usernameOrEmail;
  String profilePictureUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.usernameOrEmail,
    required this.profilePictureUrl,
  });

  String get fullName => "$firstName $lastName";
}
