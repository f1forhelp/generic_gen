part of "../generic_gen.dart";

class _Utils {
  _Utils._();

  static Future<_GenericGenConf> parseSourceGen() async {
    final File sourceGenFile = File('${path.current}/generic_gen.json');
    if (!await sourceGenFile.exists()) {
      throw Exception('generic_gen.json not found');
    }
    final String sourceGenJson = await sourceGenFile.readAsString();
    final Map<String, dynamic> sourceGenMap =
        jsonDecode(sourceGenJson) as Map<String, dynamic>;
    return _GenericGenConf.fromJson(sourceGenMap);
  }

  static logError(String message) {
    // ANSI escape codes for text color
    const String red = '\u001b[31m';
    const String reset = '\u001b[0m';

    // Print colored output
    print('$red$message$reset');
  }

  static logSuccess(String message) {
    // ANSI escape codes for text color
    const String green = '\u001b[32m';
    const String reset = '\u001b[0m';

    // Print colored output
    print('$green$message$reset');
  }

  static String logInfo(String message) {
    // ANSI escape codes for text color
    const String blue = '\u001b[33m';
    const String reset = '\u001b[0m';

    // Print colored output
    print('$blue$message$reset');
    return '$blue$message$reset';
  }
}
