import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> writeTokenToSecureStorage(String token) async {
  const storage = FlutterSecureStorage();
  return storage.write(key: 'token', value: token);
}
