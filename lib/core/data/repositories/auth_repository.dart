class AuthRepository {
  Future login({required String username, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future signUpStart({required String emailAddress}) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future completeProfile(
      {required String userName,
      required String firstName,
      required String lastName,
      required String phoneNumber,
      required String password,
      String? inviteCode}) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
