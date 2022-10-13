

import '../../models/user.dart';

class AuthenticationProvider {

  Future<User> login(String email, String password) async {
    // await Future.delayed(
    //   const Duration(
    //     seconds: 3,
    //   ),
    // );
    
    if(email == "test@test.com" && password == "test") {
      return User(
        id: "123456789",
        email: "test@test.com",
        name: "Test",
        lastname: "Meedu",
        birthday: DateTime(1993, 12, 1),
      );
    }

    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    return true;
  }
}