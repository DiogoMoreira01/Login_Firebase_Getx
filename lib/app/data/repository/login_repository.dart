import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_firebase/app/data/provider/login_provider.dart';

class LoginRepository {
  late final AuthenticationService apiClient = AuthenticationService();

  //LoginRepository(myApi);

  Future<String?> signUp(String email, String password) {
    return apiClient.signUp(email: email, password: password);
  }

  Future<UserCredential?> signIn(String email, String password) {
    return apiClient.signIn(email: email, password: password);
  }

  signOut() {
    apiClient.signOut();
  }
}
