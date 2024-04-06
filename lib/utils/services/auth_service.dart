import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  Future<bool> isAuthorized() async {
    final String? token = await _storage.read(key: 'token');
    return token != null && token.isNotEmpty;
  }

  void authorize(String token) {
    _storage.write(key: 'token', value: token);
  }

  void deAuthorize() async {
    await _storage.delete(key: 'token');
  }

  Future<String?> getToken() {
    return _storage.read(key: 'token');
  }
}
