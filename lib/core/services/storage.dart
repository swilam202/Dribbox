
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

Future<void> writeData(String key, String value) async {
   await storage.write(key: key, value: value);
}

Future<String?> readData(String key) async {
  return await storage.read(key: key);
}

