import 'package:june/june.dart';
import 'package:que_based_ecom_fe/src/utils/get_token_from_secure_storage.dart';

class ProfileStore extends JuneState {
  bool isSignedIn = false;

  ProfileStore() {
    checkForToken().then((token) {
      if (token != null && token != '') {
        updateIsSignedIn(true);
      }
    });
  }

  Future<String?> checkForToken() async {
    final token = await getTokenFromSecureStorage();
    return token;
  }

  updateIsSignedIn(bool isSignedInArg) {
    isSignedIn = isSignedInArg;
    setState();
  }
}
