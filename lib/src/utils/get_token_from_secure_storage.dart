import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> getTokenFromSecureStorage() async {
  const storage = FlutterSecureStorage();
  return storage.read(key: 'token');
}
