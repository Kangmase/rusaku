import 'dart:convert';

import 'package:crypto/crypto.dart';

class PasswordHash {
  static String generateSha1(String password) {
    var bytes = utf8.encode(password);
    var digest = sha1.convert(bytes);
    return digest.toString();
  }
}