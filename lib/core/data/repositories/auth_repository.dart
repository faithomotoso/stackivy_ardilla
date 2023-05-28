class AuthRepository {
  Future signIn() async {}

  Future signUpStart({required String emailAddress}) async {}

  Future completeProfile(
      {required String userName,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password}) async {}
}
