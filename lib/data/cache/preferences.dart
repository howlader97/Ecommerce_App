abstract class Preferences {
  Future<bool> setBoolValue({required String keyName, required bool value});

  Future<bool?> getBoolValue({required String keyName});

  Future<bool> setIntValue({required String keyName, required int value});

  Future<int?> getIntValue({required String keyName});

  Future<bool> setDoubleValue({required String keyName, required double value});

  Future<double?> getDoubleValue({required String keyName});

  Future<bool?> setStringValue({required String keyName, required String value});

  Future<String?> getStringValue({required String keyName});

  Future<List<int>?> getIntList({required String keyName});

  Future<bool> clearAll();

  Future<bool> clearOne({required String keyName});

  Future<bool> containsKey({required String keyName});

  Future<void> setSecureStringValue({required String keyName, required String value});

  Future<String?> getSecureStringValue({required String keyName});
}